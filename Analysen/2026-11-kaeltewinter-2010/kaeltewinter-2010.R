# =============================================================================
# Klima Kompass - Evidenzcheck "Kaeltewinter wie 2010"
# Skript:  Analysen/2026-11-kaeltewinter-2010/kaeltewinter-2010.R
# SAP:     SAP_kaeltewinter-2010.md, Version 1.0, Status final,
#          eingefroren durch Daniel Saure am 23.11.2026 (Commit 2a2353e)
# Autor:   Claude (analyst-Subagent), 23.11.2026
# R:       entwickelt und ausgefuehrt mit R 4.6.1 (Details: output/session_info.txt)
#
# Aufruf (aus beliebigem Verzeichnis):
#   Rscript kaeltewinter-2010.R <Pfad zum Analyseordner>
#   (ohne Argument wird das Verzeichnis des Skripts bzw. das Arbeitsverzeichnis genutzt)
#
# Kein Netzzugriff (SAP 10). Eingelesen werden nur die abgelegten Rohdateien.
# DATENSCHNITT MAERZ 2026 (SAP 2.4 b, R6): Alle Werte nach Maerz 2026 werden
# direkt nach dem Einlesen verworfen, BEVOR irgendeine Ausgabe entsteht.
#
# -----------------------------------------------------------------------------
# Abweichungen / Auslegungen (Details: Abweichungsprotokoll_kaeltewinter-2010.md)
# -----------------------------------------------------------------------------
# A1 (Post-hoc, Ablage): DWD-Rohdateien liegen unter rohdaten/ statt
#     rohdaten/dwd/ (SAP 3.1). Ablage durch Top-Level-Session; nicht verschoben,
#     damit Pfade/Pruefsummen in run_log.txt gueltig bleiben.
# A2 (Post-hoc, Vergleichsdatei 3.5 Nr. 3): Datei liegt unter
#     Analysen/2026-09-gasspeicher-winter/rohdaten/ (nicht rohdaten/dwd/).
# A3 (Post-hoc, OWID): OWID-Datensatz vom analyst heruntergeladen (SAP 13:
#     Download durch Daniel Saure); Auftrag der Top-Level-Session.
# A4 (Post-hoc, S9-Spanne): SAP 6 nennt fuer S9 kein Spannenverfahren. Gewaehlt:
#     dasselbe parametrische Simulationsverfahren wie fuer M1 (5.4), angewendet
#     auf das Modell ohne Trend; empirischer Anteil mit Clopper-Pearson.
# A5 (Auslegung): E2 rechnet mit ungerundetem T_ref (SAP 2.0 / 11: "Rechnung
#     ungerundet"); die 0,01-Rundung gilt fuer die Zaehlvergleiche in E1/S1/S2/S14.
# A6 (Auslegung): E1 fuer S1/S2 schliesst das Referenzjahr 2010 analog zu 2.1
#     aus (n = 144); S14 ohne Ausschluss (2.5, ausdruecklich).
# A7 (Auslegung): M1-AR-Simulation: Ziehung von (phi, log sigma_e) aus der per
#     Delta-Methode transformierten asymptotischen Kovarianz von nlme::gls
#     (apVar), Block-diagonal zu Var(b); P*_b = Phi((T_ref - yhat*)/sigma*_e).
# A8 (Auslegung): S6, S7, S12, S13 werden mit M1 (t-praediktiv, Spanne nach 5.4
#     fuer M1) gerechnet; SAP 6 bindet nur S1, S2, S14 an den Primaerschaetzer.
#     Wird nach 5.3 ein anderer Schaetzer primaer, ist das eine Rueckfrage
#     (siehe Konsolenausgabe "RUECKFRAGE").
# A9 (Post-hoc, Zusatzinformation zu 3.5 Nr. 2): Die DWD-Winterdatei ist das
#     ungewichtete Mittel der drei Monate; zur Erklaerung der Abweichungen wird
#     dieser Vergleich zusaetzlich ausgegeben. Keine Rechnung wird geaendert.
# A10 (Post-hoc, Zusatzinformation zu E1): Gleichstaende bei 0,01-Rundung werden
#     im Log namentlich genannt.
# Keine "Abweichung vom SAP - Rueckfrage an Mensch" im Sinne einer nicht
# umsetzbaren Vorgabe, ausser sie wird unten zur Laufzeit gemeldet.
# =============================================================================

# ---- SAP 10: Pakete, Seed, Pfade -------------------------------------------
suppressPackageStartupMessages({
  library(stats)
  library(nlme)     # gls mit corAR1 (M1-AR)
  library(lmtest)   # dwtest, bptest
  library(MASS)     # mvrnorm
  library(ggplot2)  # Grafiken
  library(jsonlite) # OWID-Metadaten
})

args <- commandArgs(trailingOnly = TRUE)
if (length(args) >= 1) {
  base_dir <- normalizePath(args[1], winslash = "/")
} else {
  base_dir <- normalizePath(getwd(), winslash = "/")
}
raw_dir  <- file.path(base_dir, "rohdaten")
out_dir  <- file.path(base_dir, "output")
dir.create(out_dir, showWarnings = FALSE)
gas_file <- normalizePath(file.path(base_dir, "..", "2026-09-gasspeicher-winter",
                                    "rohdaten", "dwd_gebietsmittel_deutschland_wintermonate.csv"),
                          winslash = "/", mustWork = FALSE)
run_log  <- file.path(base_dir, "run_log.txt")

# SAP 10: fester Seed, einmal am Skriptanfang
SEED <- 20261123
B    <- 10000
RNGkind("Mersenne-Twister", "Inversion", "Rejection")
set.seed(SEED)
# Reihenfolge der Zufallsziehungen (SAP 10), exakt in dieser Abfolge:
#  Z1 M1-Simulation JFM (rchisq B, dann mvrnorm B)
#  Z2 M1-AR-Simulation JFM (mvrnorm Parameter, Nachziehen bei |phi| >= 1)
#  Z3 M1-Boot JFM (sample)
#  Z4 M1-Block-Boot JFM (sample Blockstarts)
#  Z5 S1, Z6 S2, Z7 S14 (jeweils mit dem Primaerschaetzer nach 5.3)
#  Z8 S6, Z9 S7 (M1-Simulation), Z10 S8 (LOESS-Residuen-Bootstrap),
#  Z11 S9 (Simulation ohne Trend), Z12 S12, Z13 S13 (M1-Simulation)

log_lines <- character(0)
logl <- function(...) {
  s <- paste0(...)
  cat(s, "\n", sep = "")
  log_lines <<- c(log_lines, s)
}
alpha <- 0.05

# ---- SAP 3.1 / 2.4 b: Einlesen DWD + sofortiger Datenschnitt ---------------
CUT_YEAR <- 2026; CUT_MONTH <- 3   # letzter zulaessiger Monat: Maerz 2026
after_cut <- function(year, month) (year > CUT_YEAR) | (year == CUT_YEAR & month > CUT_MONTH)

read_dwd_monthly <- function(mm) {
  f <- file.path(raw_dir, sprintf("regional_averages_tm_%s.txt", mm))
  hdr <- readLines(f, n = 1)
  d <- read.table(f, sep = ";", header = TRUE, skip = 1, dec = ".",
                  strip.white = TRUE, check.names = FALSE,
                  stringsAsFactors = FALSE, fill = TRUE)
  d <- data.frame(year = as.integer(d[["Jahr"]]), month = as.integer(d[["Monat"]]),
                  tm = as.numeric(d[["Deutschland"]]))
  n_raw <- nrow(d)
  d <- d[!after_cut(d$year, d$month), ]     # DATENSCHNITT sofort nach Einlesen
  list(data = d, header = hdr, n_dropped = n_raw - nrow(d))
}

months_needed <- c("01", "02", "03", "10", "11", "12")
dwd <- lapply(months_needed, read_dwd_monthly); names(dwd) <- months_needed
mon <- do.call(rbind, lapply(dwd, `[[`, "data"))
mon <- mon[order(mon$year, mon$month), ]
rownames(mon) <- NULL

# Saisonale DWD-Winterdatei (DJF), Jahr = Jahr des Januars/Februars (Kopf: 1882 = erster Winter)
fw <- file.path(raw_dir, "regional_averages_tm_winter.txt")
win_hdr <- readLines(fw, n = 1)
win <- read.table(fw, sep = ";", header = TRUE, skip = 1, dec = ".", strip.white = TRUE,
                  check.names = FALSE, stringsAsFactors = FALSE, fill = TRUE)
win <- data.frame(year = as.integer(win[["Jahr"]]), tm = as.numeric(win[["Deutschland"]]))
# Winter y = Dez (y-1) bis Feb (y); endet im Feb y -> nach Schnitt, wenn Feb y > Maerz 2026
n_win_raw <- nrow(win)
win <- win[!after_cut(win$year, 2), ]
n_win_dropped <- n_win_raw - nrow(win)

# OWID (SAP 3.4): nur Deutschland, Datenschnitt sofort nach Einlesen
owid_file <- file.path(raw_dir, "owid", "average-monthly-surface-temperature_full.csv")
owid_meta_file <- file.path(raw_dir, "owid", "average-monthly-surface-temperature.metadata.json")
owid_available <- file.exists(owid_file)
if (owid_available) {
  ow <- read.csv(owid_file, stringsAsFactors = FALSE)
  ow <- ow[ow$code == "DEU", c("month", "temperature_2m")]
  ow$year  <- as.integer(substr(ow$month, 1, 4))
  ow$mon   <- as.integer(substr(ow$month, 6, 7))
  n_ow_raw <- nrow(ow)
  ow <- ow[!after_cut(ow$year, ow$mon), ]  # DATENSCHNITT
  n_ow_dropped <- n_ow_raw - nrow(ow)
  ow <- data.frame(year = ow$year, month = ow$mon, tm = ow$temperature_2m)
}

logl("")
logl("## Analyselauf analyst (Claude), ", format(Sys.time(), "%Y-%m-%dT%H:%M:%S%z"))
logl("Skript: kaeltewinter-2010.R; SAP v1.0 final (Commit 2a2353e); ", R.version.string)
logl("Seed ", SEED, ", B = ", B)
logl("Datenschnitt Maerz 2026 angewendet direkt nach dem Einlesen. Verworfene Zeilen (Anzahl, ohne Werte): ",
     paste(sprintf("tm_%s: %d", months_needed, sapply(dwd, `[[`, "n_dropped")), collapse = ", "),
     "; winter: ", n_win_dropped,
     if (owid_available) paste0("; OWID DEU: ", n_ow_dropped) else "")
logl("DWD-Dateikoepfe ('erstellt am'): ",
     paste(sprintf("tm_%s: %s", months_needed, sub(".*erstellt am: *", "", sapply(dwd, `[[`, "header"))), collapse = ", "),
     "; winter: ", sub(".*erstellt am: *", "", win_hdr))
logl("DWD-Winterdatei: Jahreszahl = Jahr von Januar/Februar (erster Eintrag 1882 = Dez. 1881-Feb. 1882); S1 nutzt Jahr 2010 = Dez. 2009-Feb. 2010.")

# ---- SAP 3.5: Integritaets-Checks (vor jeder Auswertung) --------------------
checks <- list()
# 3.5 Nr. 1: Vollstaendigkeit Jan 1881 - Maerz 2026, keine Fehlwerte, Bereich -15..15
expected <- expand.grid(year = 1881:2026, month = c(1, 2, 3, 10, 11, 12))
expected <- expected[!after_cut(expected$year, expected$month), ]
key <- function(d) paste(d$year, d$month)
missing_keys <- setdiff(key(expected), key(mon))
n_na <- sum(is.na(mon$tm))
n_dup <- sum(duplicated(key(mon)))
out_range <- mon[!is.na(mon$tm) & (mon$tm < -15 | mon$tm > 15), ]
chk1 <- length(missing_keys) == 0 && n_na == 0 && n_dup == 0 && nrow(out_range) == 0
checks[["3.5-1 Vollstaendigkeit/Fehlwerte/Bereich"]] <- chk1
logl("3.5-1: fehlende Monate = ", length(missing_keys), ", NA = ", n_na, ", Duplikate = ", n_dup,
     ", ausserhalb [-15, 15] = ", nrow(out_range), " -> ", ifelse(chk1, "bestanden", "NICHT bestanden"))
if (nrow(out_range) > 0 || n_na > 0 || length(missing_keys) > 0) {
  stop("SAP 3.5 Nr. 1 nicht bestanden: Stopp und Rueckfrage (kein Ausschluss).")
}

getm <- function(y, m) {
  v <- mon$tm[match(paste(y, m), key(mon))]
  v
}
is_leap <- function(y) (y %% 4 == 0 & y %% 100 != 0) | (y %% 400 == 0)
dfeb <- function(y) ifelse(is_leap(y), 29, 28)

# 3.5 Nr. 2: DJF aus Monatswerten (gewichtet) vs. saisonale DWD-Datei
djf_from_months <- function(y) (31 * getm(y - 1, 12) + 31 * getm(y, 1) + dfeb(y) * getm(y, 2)) / (62 + dfeb(y))
win$djf_calc <- djf_from_months(win$year)
win$diff <- win$djf_calc - win$tm
n_win_dev <- sum(abs(win$diff) > 0.05 + 1e-9, na.rm = TRUE)
chk2 <- n_win_dev == 0 && !any(is.na(win$diff))
checks[["3.5-2 DJF Monatswerte vs. Winterdatei (<= 0,05 K)"]] <- chk2
logl("3.5-2: Winter ", min(win$year), "-", max(win$year), ", max |Abweichung| = ",
     sprintf("%.4f", max(abs(win$diff), na.rm = TRUE)), " K, Anzahl > 0,05 K = ", n_win_dev,
     " -> ", ifelse(chk2, "bestanden", "NICHT bestanden (dokumentiert)"))
# Post-hoc-Zusatzinformation (A9, aendert keine Rechnung): Erklaerung der Abweichung durch
# Vergleich mit dem UNGEWICHTETEN Mittel der drei Monatswerte.
win$djf_ungewichtet <- (getm(win$year - 1, 12) + getm(win$year, 1) + getm(win$year, 2)) / 3
win$diff_ungewichtet <- win$djf_ungewichtet - win$tm
logl("3.5-2 Zusatz (Post-hoc A9, nur Erklaerung): ungewichtetes Monatsmittel vs. Winterdatei: max |Abweichung| = ",
     sprintf("%.4f", max(abs(win$diff_ungewichtet), na.rm = TRUE)), " K, Anzahl > 0,05 K = ",
     sum(abs(win$diff_ungewichtet) > 0.05 + 1e-9, na.rm = TRUE),
     ". S1 bleibt nach SAP 6 tagesgewichtet.")
write.csv(win[, c("year", "tm", "djf_calc", "diff", "djf_ungewichtet", "diff_ungewichtet")],
          file.path(out_dir, "check_3-5-2_djf_vs_winterdatei.csv"), row.names = FALSE)

# 3.5 Nr. 3: Abgleich Okt. 2013 - Maerz 2026 mit Gasspeicher-Ordner
if (file.exists(gas_file)) {
  gl <- readLines(gas_file)
  gl <- gl[!grepl("^#", gl)]
  gas <- read.table(text = gl, sep = ";", header = TRUE, stringsAsFactors = FALSE)
  names(gas) <- c("year", "month", "tm_gas")
  gas <- gas[!after_cut(gas$year, gas$month), ]
  in_win <- function(y, m) (y > 2013 | (y == 2013 & m >= 10)) & !after_cut(y, m)
  gas <- gas[in_win(gas$year, gas$month), ]
  exp3 <- mon[in_win(mon$year, mon$month), ]
  cmp <- merge(exp3, gas, by = c("year", "month"), all.x = TRUE)
  cmp$diff <- cmp$tm - cmp$tm_gas
  n_cmp_missing <- sum(is.na(cmp$tm_gas))
  n_cmp_dev <- sum(abs(cmp$diff) > 1e-9, na.rm = TRUE)
  chk3 <- n_cmp_missing == 0 && n_cmp_dev == 0
  write.csv(cmp[order(cmp$year, cmp$month), ], file.path(out_dir, "check_3-5-3_abgleich_gasspeicher.csv"),
            row.names = FALSE)
  logl("3.5-3: Abgleich Okt. 2013-Maerz 2026 mit Gasspeicher-Datei: ", nrow(cmp), " Monate verglichen, ",
       n_cmp_missing, " fehlen in Gasspeicher-Datei, ", n_cmp_dev, " abweichend -> ",
       ifelse(chk3, "bestanden", "NICHT bestanden (Hinweis an Daniel, betrifft Gasspeicher-Check)"))
  if (n_cmp_dev > 0) {
    dv <- cmp[!is.na(cmp$diff) & abs(cmp$diff) > 1e-9, ]
    for (i in seq_len(nrow(dv))) logl("     Abweichung ", dv$year[i], "-", sprintf("%02d", dv$month[i]),
                                      ": neu ", dv$tm[i], " vs. Gasspeicher ", dv$tm_gas[i])
  }
} else {
  chk3 <- FALSE
  logl("3.5-3: Gasspeicher-Vergleichsdatei nicht gefunden -> NICHT bestanden")
}
checks[["3.5-3 Abgleich Gasspeicher-Datei Okt 2013-Maerz 2026"]] <- chk3

# 3.5 Nr. 4: kein Monatswert nach Maerz 2026 im Arbeitsdatensatz
chk4 <- !any(after_cut(mon$year, mon$month)) && !any(after_cut(win$year, 2)) &&
  (!owid_available || !any(after_cut(ow$year, ow$month)))
checks[["3.5-4 kein Wert nach Maerz 2026"]] <- chk4
logl("3.5-4: kein Monatswert nach Maerz 2026 im Arbeitsdatensatz -> ", ifelse(chk4, "bestanden", "NICHT bestanden"))
if (!chk4) stop("Datenschnitt verletzt - Abbruch vor jeder Ausgabe.")

# Arbeitsdatensatz (nur bis Maerz 2026) zur Nachpruefung ablegen
write.csv(mon, file.path(out_dir, "arbeitsdaten_monatswerte_bis_2026-03.csv"), row.names = FALSE)

# ---- SAP 2.0 / 2.5 / 6: Zielgroessen ----------------------------------------
yrs <- 1881:2026
jfm <- function(y) (31 * getm(y, 1) + dfeb(y) * getm(y, 2) + 31 * getm(y, 3)) / (62 + dfeb(y))
djf <- djf_from_months
octmar <- function(y) (31 * getm(y - 1, 10) + 30 * getm(y - 1, 11) + 31 * getm(y - 1, 12) +
                         31 * getm(y, 1) + dfeb(y) * getm(y, 2) + 31 * getm(y, 3)) / (154 + dfeb(y))
novmar <- function(y) (30 * getm(y - 1, 11) + 31 * getm(y - 1, 12) + 31 * getm(y, 1) +
                         dfeb(y) * getm(y, 2) + 31 * getm(y, 3)) / (123 + dfeb(y))

series <- data.frame(year = yrs, T_jfm = jfm(yrs))
series$T_djf    <- ifelse(yrs >= 1882, djf(yrs), NA)
series$T_octmar <- ifelse(yrs >= 1882, octmar(yrs), NA)
series$U_novmar <- ifelse(yrs >= 1882, novmar(yrs), NA)
stopifnot(!any(is.na(series$T_jfm)), !any(is.na(series[series$year >= 1882, -1])))
write.csv(series, file.path(out_dir, "zielgroessen_jahreswerte_1881-2026.csv"), row.names = FALSE)

# Referenzwerte
T_ref      <- series$T_jfm[series$year == 2010]
T_ref_djf  <- series$T_djf[series$year == 2010]
T_ref_om   <- series$T_octmar[series$year == 2010]
# SAP 2.5: T_ref^S14 = (30 Nov2010 + 31 Dez2010 + 31 Jan2010 + 28 Feb2010 + 31 Mar2010)/151
T_ref_S14  <- (30 * getm(2010, 11) + 31 * getm(2010, 12) + 31 * getm(2010, 1) +
                 28 * getm(2010, 2) + 31 * getm(2010, 3)) / 151
logl("Referenzwerte (ungerundet): T_ref(JFM 2010) = ", sprintf("%.4f", T_ref),
     "; DJF 2009/10 = ", sprintf("%.4f", T_ref_djf), "; Okt-Mar 2009/10 = ", sprintf("%.4f", T_ref_om),
     "; T_ref^S14 = ", sprintf("%.4f", T_ref_S14))

# ---- Hilfsfunktionen -------------------------------------------------------
r2 <- function(x) round(x, 2)              # SAP 2.0: Vergleich auf 0,01 degC
cp <- function(k, n) { ci <- binom.test(k, n, conf.level = 0.95)$conf.int; c(lo = ci[1], hi = ci[2]) }
fmt_p <- function(p) {                     # SAP 11: Prozent ohne Nachkommastelle, < 1 %: 1 signifikante Stelle
  if (is.na(p)) return("NA")
  pc <- 100 * p
  if (pc == 0) return("0 %")
  if (pc < 1) return(paste0(formatC(signif(pc, 1), format = "fg", digits = 1, decimal.mark = ","), " %"))
  paste0(round(pc), " %")
}
fmt_rt <- function(x) {                    # SAP 11: ganze Jahre, ab 20 auf 5 Jahre
  if (is.na(x)) return("NA")
  if (!is.finite(x)) return("nicht begrenzt")
  if (x >= 20) return(as.character(5 * round(x / 5)))
  as.character(round(x))
}
ret_time <- function(p, lo, hi) {          # SAP 5.4: 1/P mit [1/oberes, 1/unteres]
  c(rt = ifelse(p > 0, 1 / p, Inf), rt_lo = ifelse(hi > 0, 1 / hi, Inf), rt_hi = ifelse(lo > 0, 1 / lo, Inf))
}

# E1-Zaehlung
e1_count <- function(vals, yrs_v, ref, exclude = integer(0)) {
  keep <- !(yrs_v %in% exclude) & !is.na(vals)
  hit  <- r2(vals[keep]) <= r2(ref)
  k <- sum(hit); n <- sum(keep); ci <- cp(k, n)
  list(k = k, n = n, share = k / n, lo = ci[["lo"]], hi = ci[["hi"]], years = yrs_v[keep][hit])
}

# ---- Modellfunktionen (SAP 2.2, 5.3, 5.4) ----------------------------------
fit_m1 <- function(yv, y) {
  X <- cbind(1, yv)
  m <- lm(y ~ yv)
  list(m = m, X = X, XtXi = solve(crossprod(X)), b = coef(m), n = length(y),
       s = summary(m)$sigma, e = resid(m), fit = fitted(m))
}
# M1 t-praediktiv
p_m1 <- function(f, x0, ref) {
  x <- c(1, x0)
  yhat <- sum(x * f$b)
  h <- as.numeric(t(x) %*% f$XtXi %*% x)
  p <- pt((ref - yhat) / (f$s * sqrt(1 + h)), df = f$n - 2)
  list(p = p, yhat = yhat, h = h)
}
# M1 Parametersimulation (5.4)
sim_m1 <- function(f, x0, ref, Bn = B) {
  df <- f$n - 2
  s2 <- f$s^2 * df / rchisq(Bn, df)                       # sigma*^2
  z  <- mvrnorm(Bn, mu = c(0, 0), Sigma = f$XtXi)         # ~ N(0, (X'X)^-1)
  bs <- sweep(z * sqrt(s2), 2, f$b, `+`)                  # beta* ~ N(b, sigma*^2 (X'X)^-1)
  mu <- bs[, 1] + bs[, 2] * x0
  pnorm((ref - mu) / sqrt(s2))
}
# M1-AR (5.3 Zeile 2, 5.4)
fit_ar <- function(yv, y) {
  d <- data.frame(yv = yv, y = y)
  g <- gls(y ~ yv, data = d, correlation = corAR1(form = ~ yv), method = "ML")
  phi <- as.numeric(coef(g$modelStruct$corStruct, unconstrained = FALSE))
  sig_u <- g$sigma
  sig_e <- sig_u * sqrt(1 - phi^2)
  list(g = g, b = coef(g), Vb = vcov(g), phi = phi, sig_u = sig_u, sig_e = sig_e, yv = yv, y = y)
}
p_ar <- function(fa, x0, ref) {
  ylast <- fa$y[length(fa$y)]; xlast <- fa$yv[length(fa$yv)]
  stopifnot(x0 == xlast + 1)
  u_last <- ylast - (fa$b[1] + fa$b[2] * xlast)
  yhat <- as.numeric(fa$b[1] + fa$b[2] * x0 + fa$phi * u_last)
  x <- c(1, x0)
  pv <- fa$sig_e^2 + as.numeric(t(x) %*% fa$Vb %*% x)
  list(p = pnorm((ref - yhat) / sqrt(pv)), yhat = yhat, pv = pv, u_last = u_last)
}
sim_ar <- function(fa, x0, ref, Bn = B) {
  ap <- fa$g$apVar
  if (is.character(ap)) stop("M1-AR: apVar nicht verfuegbar: ", ap)
  th <- attr(ap, "Pars")                                  # (theta = log((1+phi)/(1-phi)), log sigma_u)
  phi <- fa$phi
  J <- rbind(c((1 - phi^2) / 2, 0), c(-phi / 2, 1))      # d(phi, log sigma_e)/d(theta, log sigma_u)
  Vv <- J %*% ap %*% t(J)
  mu_v <- c(phi, log(fa$sig_e))
  Sig <- matrix(0, 4, 4); Sig[1:2, 1:2] <- fa$Vb; Sig[3:4, 3:4] <- Vv
  mu <- c(fa$b, mu_v)
  draws <- mvrnorm(Bn, mu, Sig)
  n_rej <- 0
  bad <- abs(draws[, 3]) >= 1
  while (any(bad)) {                                      # 5.4: |phi| >= 1 verwerfen und neu ziehen
    n_rej <- n_rej + sum(bad)
    draws[bad, ] <- mvrnorm(sum(bad), mu, Sig)
    bad <- abs(draws[, 3]) >= 1
  }
  ylast <- fa$y[length(fa$y)]; xlast <- fa$yv[length(fa$yv)]
  u_last <- ylast - (draws[, 1] + draws[, 2] * xlast)
  yhat <- draws[, 1] + draws[, 2] * x0 + draws[, 3] * u_last
  P <- pnorm((ref - yhat) / exp(draws[, 4]))
  list(P = P, n_rej = n_rej, share_rej = n_rej / (Bn + n_rej))
}
# M1-Boot / M1-Block-Boot (5.3 Zeilen 3/4, 5.4)
p_boot_point <- function(f, x0, ref) {
  yhat <- f$b[1] + f$b[2] * x0
  mean(yhat + f$e <= ref)
}
mbb_index <- function(n, l = 3) {                         # eigene Moving-Block-Bootstrap-Funktion (SAP 10)
  starts <- sample.int(n - l + 1, ceiling(n / l), replace = TRUE)
  idx <- as.vector(sapply(starts, function(s) s:(s + l - 1)))
  idx[seq_len(n)]
}
sim_boot <- function(f, x0, ref, block = FALSE, Bn = B) {
  n <- f$n; X <- f$X
  P <- numeric(Bn)
  H <- f$XtXi %*% t(X)
  for (b in seq_len(Bn)) {
    idx <- if (block) mbb_index(n, 3) else sample.int(n, n, replace = TRUE)
    ys <- f$fit + f$e[idx]
    bs <- as.vector(H %*% ys)
    es <- ys - as.vector(X %*% bs)
    P[b] <- mean(bs[1] + bs[2] * x0 + es <= ref)
  }
  P
}
qs <- function(P) as.numeric(quantile(P, c(0.025, 0.975), type = 7))

# ---- SAP 2.1 / 5.1: E1 primaer ---------------------------------------------
e1_all <- e1_count(series$T_jfm, series$year, T_ref, exclude = 2010)
periods <- list("1881-2026" = 1881:2026, "1881-1930" = 1881:1930, "1931-1960" = 1931:1960,
                "1961-1990" = 1961:1990, "1991-2020" = 1991:2020, "1997-2026" = 1997:2026)
tab1 <- do.call(rbind, lapply(names(periods), function(nm) {
  s <- series[series$year %in% periods[[nm]], ]
  r <- e1_count(s$T_jfm, s$year, T_ref, exclude = 2010)
  data.frame(Zeitraum = nm, k = r$k, n = r$n, Anteil = r$share, CP_unten = r$lo, CP_oben = r$hi,
             Jahre = paste(r$years, collapse = " "))
}))
rank2010 <- rank(r2(series$T_jfm), ties.method = "min")[series$year == 2010]
hits <- e1_all$years
last_before <- if (any(hits < 2010)) max(hits[hits < 2010]) else "keines"
first_after <- if (any(hits > 2010)) min(hits[hits > 2010]) else "keines"
write.csv(tab1, file.path(out_dir, "tabelle1_E1.csv"), row.names = FALSE)
logl("E1: T_ref = ", sprintf("%.2f", T_ref), " degC; k1 = ", e1_all$k, " von n = ", e1_all$n,
     "; h1 = ", sprintf("%.4f", e1_all$share), " [CP ", sprintf("%.4f", e1_all$lo), "; ",
     sprintf("%.4f", e1_all$hi), "]; Rang 2010 = ", rank2010, " von 146 (1 = kaeltestes, ties = min)")
ties_e1 <- series$year[r2(series$T_jfm) == r2(T_ref) & series$year != 2010]
logl("E1 Zusatz (A10): Gleichstand mit T_ref nach 0,01-Rundung (zaehlt als 'mindestens so kalt'): ",
     ifelse(length(ties_e1) > 0, paste(sprintf("%d (ungerundet %.4f)", ties_e1, series$T_jfm[series$year %in% ties_e1]),
                                       collapse = ", "), "keiner"))
logl("E1: Jahre mit T_y <= T_ref: ", paste(hits, collapse = " "),
     "; letztes vor 2010: ", last_before, "; erstes nach 2010: ", first_after)

# ---- SAP 2.2 / 5.1: E2 M1 auf 1971-2026 -------------------------------------
w <- series$year >= 1971 & series$year <= 2026
f1 <- fit_m1(series$year[w], series$T_jfm[w])
stopifnot(f1$n == 56)
pm1 <- p_m1(f1, 2027, T_ref)
ci_fit <- predict(f1$m, newdata = data.frame(yv = c(2027, 2010)), interval = "confidence", level = 0.95)
z2010 <- f1$e[series$year[w] == 2010] / f1$s
rank_res2010 <- rank(f1$e, ties.method = "min")[series$year[w] == 2010]
logl("M1: b0 = ", sprintf("%.5f", f1$b[1]), ", b1 = ", sprintf("%.6f", f1$b[2]), " K/Jahr (",
     sprintf("%.3f", 10 * f1$b[2]), " K/Dekade), sigma = ", sprintf("%.4f", f1$s), ", h2027 = ",
     sprintf("%.5f", pm1$h), ", yhat2027 = ", sprintf("%.4f", pm1$yhat), ", P_M1 = ", sprintf("%.5f", pm1$p))
logl("M1: yhat2027 95%-KI [", sprintf("%.3f", ci_fit[1, 2]), "; ", sprintf("%.3f", ci_fit[1, 3]),
     "]; yhat2010 = ", sprintf("%.3f", ci_fit[2, 1]), " [", sprintf("%.3f", ci_fit[2, 2]), "; ",
     sprintf("%.3f", ci_fit[2, 3]), "]; Residuum 2010 z = ", sprintf("%.3f", z2010),
     ", Rang ", rank_res2010, " von 56 (1 = negativstes)")

# ---- SAP 5.2: Diagnostik M1 -------------------------------------------------
e <- f1$e; yw <- series$year[w]
lb <- Box.test(e, lag = 5, type = "Ljung-Box", fitdf = 0)
dw <- dwtest(f1$m)
sw <- shapiro.test(e)
skew <- function(x) { x <- x - mean(x); mean(x^3) / mean(x^2)^1.5 }   # Momentenschiefe g1
bp <- bptest(f1$m)                       # Regressor = Jahr (einziger Regressor des Modells)
sd_h1 <- sd(e[yw <= 1998]); sd_h2 <- sd(e[yw >= 1999])
cd <- cooks.distance(f1$m)
cook_years <- yw[cd > 4 / 56]
acf_v <- acf(e, lag.max = 10, plot = FALSE); pacf_v <- pacf(e, lag.max = 10, plot = FALSE)
logl("5.2 Diagnostik M1: Ljung-Box(Lag 5) Q = ", sprintf("%.3f", lb$statistic), ", p = ", sprintf("%.4f", lb$p.value),
     "; Durbin-Watson = ", sprintf("%.3f", dw$statistic), " (p = ", sprintf("%.4f", dw$p.value), ")",
     "; Shapiro-Wilk W = ", sprintf("%.4f", sw$statistic), ", p = ", sprintf("%.4f", sw$p.value),
     "; Schiefe g1 = ", sprintf("%.3f", skew(e)),
     "; Breusch-Pagan BP = ", sprintf("%.3f", bp$statistic), ", p = ", sprintf("%.4f", bp$p.value),
     "; Residual-SD 1971-1998 = ", sprintf("%.3f", sd_h1), ", 1999-2026 = ", sprintf("%.3f", sd_h2),
     "; Cook's D > 4/n: ", ifelse(length(cook_years) > 0, paste(cook_years, collapse = " "), "keine"))

# ---- SAP 5.3: deterministische Umschaltregel --------------------------------
lb_sig <- lb$p.value < alpha; sw_sig <- sw$p.value < alpha
primary <- if (!lb_sig && !sw_sig) "M1" else if (lb_sig && !sw_sig) "M1-AR" else if (!lb_sig && sw_sig) "M1-Boot" else "M1-Block-Boot"
logl("5.3 Umschaltregel: Ljung-Box p < 0,05: ", ifelse(lb_sig, "ja", "nein"),
     "; Shapiro-Wilk p < 0,05: ", ifelse(sw_sig, "ja", "nein"), " -> Primaerschaetzer: ", primary)
if (primary != "M1") {
  logl("RUECKFRAGE (A8): Primaerschaetzer ist nicht M1; S6, S7, S12, S13 werden trotzdem mit M1 gerechnet (Auslegung A8).")
}

tab3 <- data.frame(
  Pruefung = c("Ljung-Box Lag 5 (fitdf = 0)", "Durbin-Watson (Information)", "Shapiro-Wilk",
               "Schiefe g1 (Information)", "Breusch-Pagan gegen Jahr (Information)",
               "Residual-SD 1971-1998", "Residual-SD 1999-2026", "Cook's D > 4/n (Jahre)",
               "Umschaltregel 5.3"),
  Statistik = c(sprintf("Q = %.3f", lb$statistic), sprintf("DW = %.3f", dw$statistic),
                sprintf("W = %.4f", sw$statistic), sprintf("%.3f", skew(e)), sprintf("BP = %.3f", bp$statistic),
                sprintf("%.3f", sd_h1), sprintf("%.3f", sd_h2),
                ifelse(length(cook_years) > 0, paste(cook_years, collapse = " "), "keine"),
                paste0("LB sig.: ", ifelse(lb_sig, "ja", "nein"), "; SW sig.: ", ifelse(sw_sig, "ja", "nein"))),
  p_Wert = c(sprintf("%.4f", lb$p.value), sprintf("%.4f", dw$p.value), sprintf("%.4f", sw$p.value), "",
             sprintf("%.4f", bp$p.value), "", "", "", ""),
  Ergebnis = c("", "", "", "", "", "", "", sprintf("Schwelle 4/56 = %.4f", 4 / 56), paste("Primaer:", primary)),
  stringsAsFactors = FALSE)
write.csv(tab3, file.path(out_dir, "tabelle3_diagnostik.csv"), row.names = FALSE)
write.csv(data.frame(Jahr = yw, Residuum = e, Cooks_D = cd, Hebel = hatvalues(f1$m)),
          file.path(out_dir, "M1_residuen_cooksD.csv"), row.names = FALSE)
write.csv(data.frame(Lag = 1:10, ACF = acf_v$acf[-1], PACF = as.vector(pacf_v$acf)),
          file.path(out_dir, "M1_acf_pacf.csv"), row.names = FALSE)

# ---- SAP 5.4: Unsicherheit aller vier Schaetzer fuer JFM (Z1-Z4) -------------
fa1 <- fit_ar(yw, series$T_jfm[w])
par1 <- p_ar(fa1, 2027, T_ref)
P_m1  <- sim_m1(f1, 2027, T_ref)                                   # Z1
ar_s  <- sim_ar(fa1, 2027, T_ref); P_ar <- ar_s$P                  # Z2
pb_pt <- p_boot_point(f1, 2027, T_ref)
P_bt  <- sim_boot(f1, 2027, T_ref, block = FALSE)                  # Z3
P_bb  <- sim_boot(f1, 2027, T_ref, block = TRUE)                   # Z4
mean_diff_pp <- 100 * (mean(P_m1) - pm1$p)
logl("5.4 M1: Mittel P*_b = ", sprintf("%.5f", mean(P_m1)), " vs. t-praediktiv ", sprintf("%.5f", pm1$p),
     " (Differenz ", sprintf("%.3f", mean_diff_pp), " Pp) -> ",
     ifelse(abs(mean_diff_pp) > 0.5, "RECHENHINWEIS: > 0,5 Pp", "ok (<= 0,5 Pp)"))
logl("M1-AR: phi = ", sprintf("%.4f", fa1$phi), ", sigma_e = ", sprintf("%.4f", fa1$sig_e),
     ", b0 = ", sprintf("%.4f", fa1$b[1]), ", b1 = ", sprintf("%.6f", fa1$b[2]),
     ", u2026 = ", sprintf("%.4f", par1$u_last), ", yhat2027 = ", sprintf("%.4f", par1$yhat),
     ", P = ", sprintf("%.5f", par1$p), "; verworfene phi-Ziehungen: ", ar_s$n_rej,
     " (Anteil ", sprintf("%.4f", ar_s$share_rej), ")")

est <- list(
  "M1"            = list(p = pm1$p,  P = P_m1, verf = "OLS 1971-2026, t-praediktiv; Spanne Parametersimulation (5.4)"),
  "M1-AR"         = list(p = par1$p, P = P_ar, verf = "GLS AR(1) ML 1971-2026; Spanne asympt. Parameterziehung (5.4)"),
  "M1-Boot"       = list(p = pb_pt,  P = P_bt, verf = "Residuen-Bootstrap, Anteil yhat2027 + e_i <= T_ref; Perzentilspanne"),
  "M1-Block-Boot" = list(p = pb_pt,  P = P_bb, verf = "Moving-Block-Bootstrap (l = 3); Punktwert wie M1-Boot; Perzentilspanne"))
prim <- est[[primary]]
prim_q <- qs(prim$P)
prim_rt <- ret_time(prim$p, prim_q[1], prim_q[2])
logl("E2 PRIMAER (", primary, "): P2027 = ", sprintf("%.5f", prim$p), " [", sprintf("%.5f", prim_q[1]), "; ",
     sprintf("%.5f", prim_q[2]), "]; Wiederkehrzeit ", sprintf("%.1f", prim_rt[1]), " Jahre [",
     sprintf("%.1f", prim_rt[2]), "; ", ifelse(is.finite(prim_rt[3]), sprintf("%.1f", prim_rt[3]), "nicht begrenzt"), "]")
if (primary %in% c("M1-Boot", "M1-Block-Boot") && prim$p == 0)
  logl("E2: empirisch nicht aufloesbar, kleiner als 1/56 (5.3)")

# Generische Rechnung mit dem Primaerschaetzer fuer Zielgroessen-Varianten
run_primary <- function(yv, y, ref, x0 = 2027) {
  f <- fit_m1(yv, y)
  if (primary == "M1") { p <- p_m1(f, x0, ref)$p; P <- sim_m1(f, x0, ref) }
  if (primary == "M1-AR") { fa <- fit_ar(yv, y); p <- p_ar(fa, x0, ref)$p; P <- sim_ar(fa, x0, ref)$P }
  if (primary == "M1-Boot") { p <- p_boot_point(f, x0, ref); P <- sim_boot(f, x0, ref, FALSE) }
  if (primary == "M1-Block-Boot") { p <- p_boot_point(f, x0, ref); P <- sim_boot(f, x0, ref, TRUE) }
  list(p = p, P = P, f = f)
}

# ---- SAP 6: Sensitivitaeten -------------------------------------------------
s2rows <- list()
add_row <- function(nr, var, verf, p, P = NULL, lo = NA, hi = NA, e1 = NULL, e1b = NULL, note = "") {
  if (!is.null(P)) { q <- qs(P); lo <- q[1]; hi <- q[2] }
  rt <- if (!is.na(p)) ret_time(p, lo, hi) else c(NA, NA, NA)
  s2rows[[length(s2rows) + 1]] <<- data.frame(
    Nr = nr, Variation = var, Verfahren = verf, P_hat = p, Spanne_unten = lo, Spanne_oben = hi,
    Wiederkehr = rt[1], Wiederkehr_unten = rt[2], Wiederkehr_oben = rt[3],
    P_fmt = ifelse(is.na(p), "", fmt_p(p)),
    Spanne_fmt = ifelse(is.na(lo), "", paste0(fmt_p(lo), " bis ", fmt_p(hi))),
    Wiederkehr_fmt = ifelse(is.na(p), "", paste0(fmt_rt(rt[1]), " [", fmt_rt(rt[2]), "; ", fmt_rt(rt[3]), "]")),
    E1_k = if (is.null(e1)) NA else e1$k, E1_n = if (is.null(e1)) NA else e1$n,
    E1_Anteil = if (is.null(e1)) NA else e1$share, E1_CP_unten = if (is.null(e1)) NA else e1$lo,
    E1_CP_oben = if (is.null(e1)) NA else e1$hi,
    E1_ohne_2010_2011 = if (is.null(e1b)) "" else sprintf("k = %d, n = %d, Anteil = %.4f [CP %.4f; %.4f]",
                                                          e1b$k, e1b$n, e1b$share, e1b$lo, e1b$hi),
    Hinweis = note, stringsAsFactors = FALSE)
}
add_row("Primaer", "JFM, Referenz JFM 2010", paste(primary, "-", prim$verf), prim$p, prim$P, e1 = e1_all)

s_yrs <- series$year[series$year >= 1882]
# S1: DJF (Z5)
s1_e1 <- e1_count(series$T_djf[series$year >= 1882], s_yrs, T_ref_djf, exclude = 2010)
s1 <- run_primary(yw, series$T_djf[w], T_ref_djf)
add_row("S1", "DJF-Mittel, Referenz Dez. 2009-Feb. 2010", paste(primary, "(Schaetzer der Primaergroesse)"),
        s1$p, s1$P, e1 = s1_e1, note = paste("E1 1882-2026 ohne 2010 (A6); Jahre:", paste(s1_e1$years, collapse = " ")))
# S2: Okt-Mar (Z6)
s2_e1 <- e1_count(series$T_octmar[series$year >= 1882], s_yrs, T_ref_om, exclude = 2010)
s2 <- run_primary(yw, series$T_octmar[w], T_ref_om)
add_row("S2", "Okt.-Mar.-Mittel, Referenz Winterhalbjahr 2009/10", paste(primary, "(Schaetzer der Primaergroesse)"),
        s2$p, s2$P, e1 = s2_e1, note = paste("E1 1882-2026 ohne 2010 (A6); Jahre:", paste(s2_e1$years, collapse = " ")))
for (sx in c("S3", "S4", "S5"))
  add_row(sx, c(S3 = "Gradtagzahl G20/15 Jan.-Mar.", S4 = "kaelteste 14-Tage-Phase", S5 = "kaelteste 30-Tage-Phase")[[sx]],
          "entfallen per SAP v0.2, Grund: keine geeigneten Tagesdaten ohne unverhaeltnismaessigen Aufwand (3.2)", NA)
# S14 (Z7) - zuerst berechnet, Zeile unten in Nummernreihenfolge
s14_e1  <- e1_count(series$U_novmar[series$year >= 1882], s_yrs, T_ref_S14)
s14_e1b <- e1_count(series$U_novmar[series$year >= 1882], s_yrs, T_ref_S14, exclude = c(2010, 2011))
s14 <- run_primary(yw, series$U_novmar[w], T_ref_S14)
rank_s14 <- rank(r2(c(series$U_novmar[series$year >= 1882], T_ref_S14)), ties.method = "min")[146]
s14_list <- paste(ifelse(s14_e1$years %in% c(2010, 2011), paste0(s14_e1$years, "(teilweise ueberlappend)"),
                         s14_e1$years), collapse = " ")
# S6 (Z8), S7 (Z9): M1 auf anderen Fenstern
w6 <- series$year >= 1881; f6 <- fit_m1(series$year[w6], series$T_jfm[w6])
add_row("S6", "Trendfenster 1881-2026 (linear)", "M1 t-praediktiv; Spanne Parametersimulation (A8)",
        p_m1(f6, 2027, T_ref)$p, sim_m1(f6, 2027, T_ref))
w7 <- series$year >= 1961; f7 <- fit_m1(series$year[w7], series$T_jfm[w7])
add_row("S7", "Trendfenster 1961-2026 (linear)", "M1 t-praediktiv; Spanne Parametersimulation (A8)",
        p_m1(f7, 2027, T_ref)$p, sim_m1(f7, 2027, T_ref))
# S8: LOESS (Z10)
lo_fit <- function(y) loess(y ~ yr, data = data.frame(yr = series$year, y = y), span = 0.5, degree = 2,
                            family = "gaussian")
lo <- lo_fit(series$T_jfm)
lo_fitv <- fitted(lo); lo_res <- resid(lo)
lo_lvl <- lo_fitv[series$year == 2026]
lo_sd  <- sd(lo_res[series$year >= 1971])
p_s8 <- pnorm((T_ref - lo_lvl) / lo_sd)
P_s8 <- numeric(B)
for (b in seq_len(B)) {
  ys <- lo_fitv + lo_res[sample.int(length(lo_res), length(lo_res), replace = TRUE)]
  lb_ <- lo_fit(ys)
  P_s8[b] <- pnorm((T_ref - fitted(lb_)[series$year == 2026]) / sd(resid(lb_)[series$year >= 1971]))
}
add_row("S8", "LOESS 1881-2026 (Grad 2, span 0,5, gaussian), Niveau 2026, SD LOESS-Residuen 1971-2026",
        "Normal-praediktiv; Spanne Residuen-Bootstrap mit Neuanpassung", p_s8, P_s8,
        note = sprintf("LOESS-Niveau 2026 = %.3f degC, SD = %.3f", lo_lvl, lo_sd))
# S9: stationaer 1997-2026 (Z11)
w9 <- series$year >= 1997
y9 <- series$T_jfm[w9]; m9 <- mean(y9); sd9 <- sd(y9); n9 <- length(y9)
p_s9 <- pt((T_ref - m9) / (sd9 * sqrt(1 + 1 / n9)), df = n9 - 1)
s2_9 <- sd9^2 * (n9 - 1) / rchisq(B, n9 - 1)
mu_9 <- m9 + rnorm(B) * sqrt(s2_9 / n9)
P_s9 <- pnorm((T_ref - mu_9) / sqrt(s2_9))
add_row("S9a", "Ohne Trend, 1997-2026 stationaer, t-praediktiv", "t-praediktiv; Spanne Parametersimulation analog 5.4 (A4, Post-hoc)",
        p_s9, P_s9, note = sprintf("Mittel = %.3f, SD = %.3f, n = %d", m9, sd9, n9))
e9 <- e1_count(y9, series$year[w9], T_ref)          # 2010 im Fenster enthalten
add_row("S9b", "Ohne Trend, 1997-2026, empirischer Anteil (inkl. 2010)", "empirischer Anteil; Clopper-Pearson (A4)",
        e9$share, lo = e9$lo, hi = e9$hi, note = paste("k =", e9$k, "von", e9$n, "; Jahre:", paste(e9$years, collapse = " ")))
# S10: nicht gewaehlte Schaetzer (bereits in Z1-Z4 gerechnet)
for (nm in setdiff(names(est), primary))
  add_row("S10", paste("Nicht gewaehlter Schaetzer:", nm), est[[nm]]$verf, est[[nm]]$p, est[[nm]]$P)
add_row("S11", "Extremwertansatz GEV auf Tagesdaten-Blockminima",
        "entfallen per SAP v0.2, Grund: keine geeigneten Tagesdaten ohne unverhaeltnismaessigen Aufwand (3.2)", NA)
# S12: M1 ohne 2010 (Z12)
w12 <- w & series$year != 2010; f12 <- fit_m1(series$year[w12], series$T_jfm[w12])
add_row("S12", "M1 ohne 2010 im Trendfenster 1971-2026 (n = 55)", "M1 t-praediktiv; Spanne Parametersimulation",
        p_m1(f12, 2027, T_ref)$p, sim_m1(f12, 2027, T_ref))
# S13: Trendniveau 2026 (Z13)
pm13 <- p_m1(f1, 2026, T_ref)
add_row("S13", "Trendniveau 2026 statt 2027 (Hebelwert 2026)", "M1 t-praediktiv; Spanne Parametersimulation (A8)",
        pm13$p, sim_m1(f1, 2026, T_ref), note = sprintf("yhat2026 = %.3f, h2026 = %.5f", pm13$yhat, pm13$h))
add_row("S14", "INES-Kombinationszeitraum Nov.-Mar. (U_t), Referenz Nov./Dez. 2010 + Jan.-Mar. 2010",
        paste(primary, "(Schaetzer der Primaergroesse)"), s14$p, s14$P, e1 = s14_e1, e1b = s14_e1b,
        note = paste0("E1 1882-2026 ohne Ausschluss; Rang T_ref^S14 = ", rank_s14, " von 146; Jahre: ", s14_list))

tab2 <- do.call(rbind, s2rows)
write.csv(tab2, file.path(out_dir, "tabelle2_E2_sensitivitaeten.csv"), row.names = FALSE)

# Spannbreiten-Aussage (SAP 6): Min/Max P_hat ueber S1, S2, S6-S10, S12-S14
sens_p <- tab2[tab2$Nr %in% c("S1", "S2", "S6", "S7", "S8", "S9a", "S9b", "S10", "S12", "S13", "S14") & !is.na(tab2$P_hat), ]
logl("Spannbreite P_hat ueber E2-Sensitivitaeten (S1, S2, S6-S10, S12-S14): ",
     sprintf("%.5f", min(sens_p$P_hat)), " (", sens_p$Nr[which.min(sens_p$P_hat)], ") bis ",
     sprintf("%.5f", max(sens_p$P_hat)), " (", sens_p$Nr[which.max(sens_p$P_hat)], ")")
for (i in seq_len(nrow(tab2))) {
  r <- tab2[i, ]
  if (is.na(r$P_hat)) { logl("  ", r$Nr, ": ", r$Verfahren); next }
  logl("  ", r$Nr, " ", r$Variation, ": P = ", sprintf("%.5f", r$P_hat), " [", sprintf("%.5f", r$Spanne_unten), "; ",
       sprintf("%.5f", r$Spanne_oben), "] = ", r$P_fmt, " (", r$Spanne_fmt, "); Wiederkehr ", r$Wiederkehr_fmt,
       if (!is.na(r$E1_k)) sprintf("; E1 k = %d/%d, %.4f [CP %.4f; %.4f]", r$E1_k, r$E1_n, r$E1_Anteil, r$E1_CP_unten, r$E1_CP_oben) else "",
       if (nzchar(r$E1_ohne_2010_2011)) paste0("; E1 ohne 2010/2011: ", r$E1_ohne_2010_2011) else "")
}
logl("S14: T_ref^S14 = ", sprintf("%.2f", T_ref_S14), "; Rang ", rank_s14, " von 146; Liste: ", s14_list)

# ---- SAP 3.4: OWID-Plausibilisierung ----------------------------------------
owid_res <- NULL
if (owid_available) {
  meta <- fromJSON(owid_meta_file)
  ow_get <- function(y, m) ow$tm[match(paste(y, m), paste(ow$year, ow$month))]
  oy <- sort(unique(ow$year))
  oy <- oy[sapply(oy, function(y) all(!is.na(c(ow_get(y, 1), ow_get(y, 2), ow_get(y, 3)))))]
  ow_jfm <- (31 * ow_get(oy, 1) + dfeb(oy) * ow_get(oy, 2) + 31 * ow_get(oy, 3)) / (62 + dfeb(oy))
  common <- intersect(oy, series$year)
  dwd_c <- series$T_jfm[match(common, series$year)]; ow_c <- ow_jfm[match(common, oy)]
  rk_dwd <- rank(r2(dwd_c), ties.method = "min")[common == 2010]
  rk_ow  <- rank(r2(ow_c), ties.method = "min")[common == 2010]
  rho <- cor(dwd_c, ow_c, method = "pearson")
  owid_res <- list(period = range(common), n = length(common), rank_dwd = rk_dwd, rank_owid = rk_ow, r = rho,
                   lastUpdated = meta$columns$temperature_2m$lastUpdated)
  write.csv(data.frame(Jahr = common, JFM_DWD = dwd_c, JFM_OWID_ERA5 = ow_c),
            file.path(out_dir, "owid_vergleich_jfm.csv"), row.names = FALSE)
  logl("3.4 OWID (average-monthly-surface-temperature, ERA5, lastUpdated ", owid_res$lastUpdated, "): gemeinsamer Zeitraum ",
       owid_res$period[1], "-", owid_res$period[2], " (n = ", owid_res$n, "); Rang JFM 2010: DWD ", rk_dwd,
       ", OWID ", rk_ow, " (1 = kaeltestes); Pearson r = ", sprintf("%.4f", rho))
} else {
  logl("3.4 OWID: betrachtet, kein geeigneter Datensatz verfuegbar")
}

# ---- SAP 11: Grafiken -------------------------------------------------------
theme_set(theme_minimal(base_size = 11))
# Grafik 1
tr <- data.frame(year = c(1971, 2027), y = f1$b[1] + f1$b[2] * c(1971, 2027))
g1d <- series[, c("year", "T_jfm")]; g1d$kalt <- r2(g1d$T_jfm) <= r2(T_ref)
g1 <- ggplot(g1d, aes(year, T_jfm)) +
  geom_line(colour = "grey60") +
  geom_point(aes(colour = kalt), size = 1.6) +
  scale_colour_manual(values = c(`FALSE` = "grey40", `TRUE` = "#1f5fa8"),
                      labels = c(`FALSE` = "waermer als 2010", `TRUE` = "mindestens so kalt wie 2010"), name = NULL) +
  geom_hline(yintercept = T_ref, linetype = "dashed", colour = "#1f5fa8") +
  geom_line(data = tr, aes(year, y), colour = "#c0392b", linewidth = 0.9, inherit.aes = FALSE) +
  annotate("point", x = 2027, y = f1$b[1] + f1$b[2] * 2027, colour = "#c0392b", shape = 4, size = 2.5) +
  labs(title = "Januar bis Maerz in Deutschland, 1881-2026",
       subtitle = paste0("Mitteltemperatur Jan.-Maerz (DWD-Gebietsmittel); gestrichelt: Jan.-Maerz 2010 (",
                         format(round(T_ref, 1), nsmall = 1, decimal.mark = ","), " °C)\n",
                         "rot: linearer Trend 1971-2026, Kreuz: Trendniveau 2027 (Verlaengerung, kein Messwert)"),
       x = NULL, y = "°C", caption = "Daten: Deutscher Wetterdienst (DWD), Datenschnitt Maerz 2026") +
  theme(legend.position = "bottom")
ggsave(file.path(out_dir, "grafik1_zeitreihe_jfm.png"), g1, width = 9, height = 5, dpi = 150)

# Grafik 2: praediktive Verteilung 2027 des Primaerschaetzers
if (primary == "M1") {
  sc <- f1$s * sqrt(1 + pm1$h); xs <- seq(pm1$yhat - 4.5 * sc, pm1$yhat + 4.5 * sc, length.out = 600)
  dd <- data.frame(x = xs, d = dt((xs - pm1$yhat) / sc, df = f1$n - 2) / sc)
} else if (primary == "M1-AR") {
  sc <- sqrt(par1$pv); xs <- seq(par1$yhat - 4.5 * sc, par1$yhat + 4.5 * sc, length.out = 600)
  dd <- data.frame(x = xs, d = dnorm(xs, par1$yhat, sc))
} else {
  vals <- f1$b[1] + f1$b[2] * 2027 + f1$e
  dens <- density(vals); dd <- data.frame(x = dens$x, d = dens$y)
}
g2 <- ggplot(dd, aes(x, d)) +
  geom_area(data = dd[dd$x <= T_ref, ], fill = "#1f5fa8", alpha = 0.6) +
  geom_line() +
  geom_vline(xintercept = T_ref, linetype = "dashed", colour = "#1f5fa8") +
  labs(title = "Klimatologische Wahrscheinlichkeit, keine Wettervorhersage",
       subtitle = sprintf("Verteilung der Jan.-Maerz-Mitteltemperatur unter dem Klimazustand 2027 (Modell %s)\nFlaeche links der Linie: mindestens so kalt wie Jan.-Maerz 2010 (%s)",
                          primary, fmt_p(prim$p)),
       x = "Mitteltemperatur Januar-Maerz (°C)", y = "Dichte",
       caption = "Daten: DWD; Modell: Trend 1971-2026. Grundrate, keine Prognose fuer den Winter 2026/27.")
ggsave(file.path(out_dir, "grafik2_praediktive_verteilung_2027.png"), g2, width = 9, height = 5, dpi = 150)

# Diagnostikgrafiken (SAP 5.2)
png(file.path(out_dir, "diagnostik_M1.png"), width = 1500, height = 1000, res = 130)
par(mfrow = c(2, 3))
acf(e, lag.max = 10, main = "ACF Residuen M1")
pacf(e, lag.max = 10, main = "PACF Residuen M1")
qqnorm(e, main = "Q-Q-Plot Residuen M1"); qqline(e)
plot(yw, e, main = "Residuen gegen Jahr", xlab = "Jahr", ylab = "Residuum"); abline(h = 0, lty = 2)
plot(f1$fit, e, main = "Residuen gegen angepasste Werte", xlab = "angepasst", ylab = "Residuum")
lines(lowess(f1$fit, e), col = "red"); abline(h = 0, lty = 2)
plot(yw, cd, type = "h", main = "Cook's Distance", xlab = "Jahr", ylab = "D"); abline(h = 4 / 56, lty = 2, col = "red")
invisible(dev.off())

# ---- Zusammenfassung, Session-Info, run_log --------------------------------
res <- list(
  SAP = "SAP_kaeltewinter-2010.md v1.0 final", seed = SEED, B = B,
  T_ref = T_ref, T_ref_djf = T_ref_djf, T_ref_octmar = T_ref_om, T_ref_S14 = T_ref_S14,
  E1 = list(k = e1_all$k, n = e1_all$n, h = e1_all$share, cp = c(e1_all$lo, e1_all$hi), rank2010 = rank2010,
            years = hits, last_before = last_before, first_after = first_after),
  M1 = list(b0 = unname(f1$b[1]), b1 = unname(f1$b[2]), sigma = f1$s, h2027 = pm1$h, yhat2027 = pm1$yhat,
            yhat2027_ci = unname(ci_fit[1, 2:3]), yhat2010 = unname(ci_fit[2, 1]), yhat2010_ci = unname(ci_fit[2, 2:3]),
            z2010 = unname(z2010), rank_res2010 = unname(rank_res2010), p_t = pm1$p, mean_sim = mean(P_m1)),
  diagnostik = list(lb_Q = unname(lb$statistic), lb_p = lb$p.value, dw = unname(dw$statistic), dw_p = dw$p.value,
                    sw_W = unname(sw$statistic), sw_p = sw$p.value, skew = skew(e), bp = unname(bp$statistic),
                    bp_p = unname(bp$p.value), sd_1971_1998 = sd_h1, sd_1999_2026 = sd_h2, cook_years = cook_years),
  primary = primary,
  E2 = list(p = prim$p, span = prim_q, rt = unname(prim_rt)),
  AR = list(phi = fa1$phi, sigma_e = fa1$sig_e, p = par1$p, n_rej = ar_s$n_rej),
  S14 = list(e1 = s14_e1[c("k", "n", "share", "lo", "hi")], e1_ohne = s14_e1b[c("k", "n", "share", "lo", "hi")],
             rank = rank_s14, years = s14_e1$years, p = s14$p, span = qs(s14$P)),
  spannbreite = c(min = min(sens_p$P_hat), max = max(sens_p$P_hat)),
  owid = owid_res, checks = checks)
writeLines(toJSON(res, auto_unbox = TRUE, pretty = TRUE, digits = 8), file.path(out_dir, "ergebnisse.json"))
writeLines(capture.output(sessionInfo()), file.path(out_dir, "session_info.txt"))

logl("3.5-5 Gesamtergebnis Integritaets-Checks: ",
     paste(sprintf("%s: %s", names(checks), ifelse(unlist(checks), "bestanden", "nicht bestanden")), collapse = "; "))
logl("Ausgaben: ", paste(sort(list.files(out_dir)), collapse = ", "))
logl("Lauf ohne Fehler beendet.")
# Anhaengen an run_log.txt (nie ueberschreiben). Testlaeufe mit KW_NO_RUNLOG=1 schreiben nicht ins Log.
if (Sys.getenv("KW_NO_RUNLOG") != "1") {
  cat(paste0(log_lines, collapse = "\n"), "\n", file = run_log, append = TRUE, sep = "")
}
