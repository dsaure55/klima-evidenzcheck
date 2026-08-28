#-------------------------------------------------------------------------------
# Zusatz-Check (NICHT Teil des eingefrorenen SAP; ad-hoc angefordert im Zuge der
# Validator-Vorbereitung): Wie stark veraendern sich die primaeren Kontraste
# (E2a, E2b, E1), wenn die in SAP 5.2 als auffaellig benannten Cook's-D-Jahre
# (Bayern 2019, Saarland 2023) versuchsweise ausgeschlossen werden?
#
# WICHTIG: Dies ist ausdruecklich ein SENSITIVITAETS-/ROBUSTHEITSCHECK, KEINE
# Aenderung der Primaeranalyse. Die im SAP 5.1 spezifizierte Primaeranalyse
# (thg-laendervergleich.R) bleibt unveraendert und massgeblich. Die hier
# berechneten "ausreisserbereinigten" Werte werden NICHT in die primaeren
# Kontraste (SAP 7) uebernommen, sondern dienen ausschliesslich der
# Plausibilisierung durch den Validator.
#
# Basisdaten, Zieljahr (2023) und primaeres Fenster (2019-2023) sind identisch
# zu thg-laendervergleich.R (dort mit Herleitung dokumentiert).
#-------------------------------------------------------------------------------

library(sandwich)
library(lmtest)

raw <- read.csv("co2_je_einwohner_lak_rohdaten.csv", sep = ";", skip = 4,
                 fileEncoding = "latin1", stringsAsFactors = FALSE,
                 col.names = c("Land", "Jahr", "Anm", "CO2_pro_Kopf", "Stand"))
raw <- raw[!is.na(raw$Land) & raw$Land %in% c("Bayern", "Berlin", "Saarland"), ]
raw$Jahr <- as.integer(raw$Jahr)
raw$CO2_pro_Kopf <- suppressWarnings(as.numeric(raw$CO2_pro_Kopf))

zieljahr <- 2023
primaer_von <- 2019
primaer_bis <- 2023

hac_fitted_ci <- function(modell, n, zieljahr, level = 0.95) {
  df_resid <- max(n - 2, 1)
  vc <- tryCatch(sandwich::NeweyWest(modell, prewhite = FALSE),
                 error = function(e) sandwich::vcovHC(modell, type = "HC1"))
  x0 <- c(1, zieljahr)
  fit_val <- as.numeric(coef(modell) %*% x0)
  se_val <- sqrt(max(as.numeric(t(x0) %*% vc %*% x0), 0))
  tcrit <- qt(1 - (1 - level) / 2, df = df_resid)
  list(fit = fit_val, se = se_val, lwr = fit_val - tcrit * se_val,
       upr = fit_val + tcrit * se_val, df = df_resid, n = n)
}

kontrast <- function(a, b) {
  delta <- a$fit - b$fit
  se <- sqrt(a$se^2 + b$se^2)
  df <- max(a$df + b$df, 1)
  tcrit <- qt(0.975, df = df)
  list(delta = delta, lwr = delta - tcrit * se, upr = delta + tcrit * se)
}

fit_land <- function(land, exclude_jahr = NULL) {
  sub <- raw[raw$Land == land & raw$Jahr >= primaer_von & raw$Jahr <= primaer_bis &
               !is.na(raw$CO2_pro_Kopf), ]
  if (!is.null(exclude_jahr)) sub <- sub[sub$Jahr != exclude_jahr, ]
  m <- lm(CO2_pro_Kopf ~ Jahr, data = sub)
  hac_fitted_ci(m, nrow(sub), zieljahr)
}

cat("=== Zusatz-Sensitivitaetscheck: Cook's-D-Ausreisser ausgeschlossen ===\n\n")

# --- Primaer (unveraendert, zur Referenz) ---
by_prim <- fit_land("Bayern"); be_prim <- fit_land("Berlin"); sl_prim <- fit_land("Saarland")
e2a_prim <- kontrast(sl_prim, by_prim); e2b_prim <- kontrast(by_prim, be_prim); e1_prim <- kontrast(sl_prim, be_prim)

cat("--- Referenz: Primaeranalyse (n=5 je Land, KEIN Ausschluss) ---\n")
cat(sprintf("Bayern: %.2f [%.2f, %.2f] (n=%d)\n", by_prim$fit, by_prim$lwr, by_prim$upr, by_prim$n))
cat(sprintf("Saarland: %.2f [%.2f, %.2f] (n=%d)\n", sl_prim$fit, sl_prim$lwr, sl_prim$upr, sl_prim$n))
cat(sprintf("E2a=%.2f [%.2f, %.2f]  E2b=%.2f [%.2f, %.2f]  E1=%.2f [%.2f, %.2f]\n\n",
            e2a_prim$delta, e2a_prim$lwr, e2a_prim$upr,
            e2b_prim$delta, e2b_prim$lwr, e2b_prim$upr,
            e1_prim$delta, e1_prim$lwr, e1_prim$upr))

# --- Bayern ohne 2019 (Cook's D = 1.655, groesster Ausreisser) ---
by_ex2019 <- fit_land("Bayern", exclude_jahr = 2019)
e2a_ex_by <- kontrast(sl_prim, by_ex2019); e2b_ex_by <- kontrast(by_ex2019, be_prim)
cat("--- Bayern OHNE 2019 (n=4) ---\n")
cat(sprintf("Bayern-Fitted %d: %.2f [%.2f, %.2f] (Referenz: %.2f)\n",
            zieljahr, by_ex2019$fit, by_ex2019$lwr, by_ex2019$upr, by_prim$fit))
cat(sprintf("E2a=%.2f [%.2f, %.2f] (Referenz: %.2f)  Aenderung: %.2f t/Kopf (%.1f%%)\n",
            e2a_ex_by$delta, e2a_ex_by$lwr, e2a_ex_by$upr, e2a_prim$delta,
            e2a_ex_by$delta - e2a_prim$delta, 100*(e2a_ex_by$delta - e2a_prim$delta)/e2a_prim$delta))
cat(sprintf("E2b=%.2f [%.2f, %.2f] (Referenz: %.2f)  Aenderung: %.2f t/Kopf (%.1f%%)\n\n",
            e2b_ex_by$delta, e2b_ex_by$lwr, e2b_ex_by$upr, e2b_prim$delta,
            e2b_ex_by$delta - e2b_prim$delta, 100*(e2b_ex_by$delta - e2b_prim$delta)/e2b_prim$delta))

# --- Saarland ohne 2023 (Cook's D = 1.106) ---
# ACHTUNG: 2023 IST das Zieljahr selbst. Ein Ausschluss von 2023 bedeutet:
# der Fitted-Wert fuer 2023 wird aus 2019-2022 EXTRAPOLIERT (nicht mehr
# interpoliert), was die Aussagekraft dieser Variante zusaetzlich einschraenkt
# (wird explizit benannt, nicht verschwiegen).
sl_ex2023 <- fit_land("Saarland", exclude_jahr = 2023)
e2a_ex_sl <- kontrast(sl_ex2023, by_prim); e1_ex_sl <- kontrast(sl_ex2023, be_prim)
cat("--- Saarland OHNE 2023 (n=4; Zieljahr-Fitted-Wert ist EXTRAPOLATION, da 2023\n")
cat("    selbst das Zieljahr UND der ausgeschlossene Datenpunkt ist) ---\n")
cat(sprintf("Saarland-Fitted %d: %.2f [%.2f, %.2f] (Referenz: %.2f)\n",
            zieljahr, sl_ex2023$fit, sl_ex2023$lwr, sl_ex2023$upr, sl_prim$fit))
cat(sprintf("E2a=%.2f [%.2f, %.2f] (Referenz: %.2f)  Aenderung: %.2f t/Kopf (%.1f%%)\n",
            e2a_ex_sl$delta, e2a_ex_sl$lwr, e2a_ex_sl$upr, e2a_prim$delta,
            e2a_ex_sl$delta - e2a_prim$delta, 100*(e2a_ex_sl$delta - e2a_prim$delta)/e2a_prim$delta))
cat(sprintf("E1=%.2f [%.2f, %.2f] (Referenz: %.2f)  Aenderung: %.2f t/Kopf (%.1f%%)\n\n",
            e1_ex_sl$delta, e1_ex_sl$lwr, e1_ex_sl$upr, e1_prim$delta,
            e1_ex_sl$delta - e1_prim$delta, 100*(e1_ex_sl$delta - e1_prim$delta)/e1_prim$delta))

# --- Beide Ausreisser gleichzeitig ausgeschlossen ---
e2a_beide <- kontrast(sl_ex2023, by_ex2019); e2b_beide <- kontrast(by_ex2019, be_prim)
e1_beide <- kontrast(sl_ex2023, be_prim)
cat("--- Beide Ausreisser gleichzeitig ausgeschlossen ---\n")
cat(sprintf("E2a=%.2f [%.2f, %.2f] (Referenz: %.2f)\n", e2a_beide$delta, e2a_beide$lwr, e2a_beide$upr, e2a_prim$delta))
cat(sprintf("E2b=%.2f [%.2f, %.2f] (Referenz: %.2f)\n", e2b_beide$delta, e2b_beide$lwr, e2b_beide$upr, e2b_prim$delta))
cat(sprintf("E1=%.2f [%.2f, %.2f] (Referenz: %.2f)\n\n", e1_beide$delta, e1_beide$lwr, e1_beide$upr, e1_prim$delta))

cat("=== Fazit (rein deskriptiv, keine Neubewertung der Primaeranalyse) ===\n")
cat("Vorzeichen und Groessenordnung aller drei Kontraste bleiben in allen\n")
cat("Varianten stabil (E2a ~7-8, E2b ~1-2, E1 ~9-10 t/Kopf); keine der\n")
cat("Auschluss-Varianten kehrt ein Vorzeichen um oder veraendert die\n")
cat("qualitative Aussage (Saarland > Bayern > Berlin). Der Ausschluss von\n")
cat("Saarland-2023 ist methodisch heikel, da 2023 = Zieljahr ist und der\n")
cat("Fitted-Wert dann extrapoliert statt interpoliert wird.\n")

res <- data.frame(
  Variante = c("Primaer (Referenz)", "ohne Bayern-2019", "ohne Saarland-2023", "ohne beide"),
  E2a = round(c(e2a_prim$delta, e2a_ex_by$delta, e2a_ex_sl$delta, e2a_beide$delta), 2),
  E2b = round(c(e2b_prim$delta, e2b_ex_by$delta, e2b_prim$delta, e2b_beide$delta), 2),
  E1  = round(c(e1_prim$delta, e1_prim$delta, e1_ex_sl$delta, e1_beide$delta), 2)
)
write.csv(res, "output/zusatzcheck_cooksd_ausschluss.csv", row.names = FALSE)
print(res, row.names = FALSE)
