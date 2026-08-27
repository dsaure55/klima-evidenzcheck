#-------------------------------------------------------------------------------
# Titel:   DE-Emissionen: Trendprojektion 2040 vs. gesetzlichem Zielpfad (-88% ggue. 1990)
# SAP:     SAP_DE-Emissionen-Trendprojektion-2040.md, Version 1.0
# Quelle:  Umweltbundesamt via klimadashboard.de (CC BY 4.0), Zugriff 2026-08-27
#-------------------------------------------------------------------------------

# 0. Pakete ---------------------------------------------------------------
# install.packages(c("sandwich", "lmtest", "forecast", "ggplot2"))
library(sandwich)
library(lmtest)
library(forecast)
library(ggplot2)

# 1. Daten ------------------------------------------------------------------
jahr <- 1990:2025
emissionen <- c(1252.94,1206.27,1157.88,1148.42,1130.77,1123.36,1140.15,1104.73,
                 1079.92,1045.47,1042.91,1056.99,1036.54,1030.42,1010.54, 988.70,
                 1001.96, 963.47, 964.88, 901.24, 933.21, 907.57, 916.90, 936.57,
                  895.19, 898.56, 898.99, 886.24, 850.10, 797.96, 730.93, 762.74,
                  749.23, 669.54, 649.74, 648.83)

df <- data.frame(jahr = jahr, emissionen = emissionen)

ziel_2040 <- 1252.94 * (1 - 0.88)
cat(sprintf("2040-Zielwert (gesetzlich, -88%% ggue. 1990): %.1f Mt CO2-Aeq.\n", ziel_2040))

# 2. Zeitfenster gemaess SAP Abschnitt 5.1 -----------------------------------
fenster <- list(
  A = list(von = 1990, bis = 2025, inferenz = TRUE),
  B = list(von = 2015, bis = 2025, inferenz = TRUE),
  C = list(von = 2020, bis = 2025, inferenz = FALSE)
)

# 3. Primaeranalyse je Fenster: OLS + Diagnostik + HAC-Inferenz + PI --------
analysiere_fenster <- function(name, von, bis, projektionsjahr = 2040, inferenz = TRUE) {

  sub <- subset(df, jahr >= von & jahr <= bis)
  modell <- lm(emissionen ~ jahr, data = sub)

  cat(sprintf("\n=== Fenster %s (%d-%d, n=%d) ===\n", name, von, bis, nrow(sub)))

  dw <- tryCatch(lmtest::dwtest(modell), error = function(e) NULL)
  shapiro <- tryCatch(shapiro.test(residuals(modell)), error = function(e) NULL)
  if (!is.null(dw))      cat(sprintf("Durbin-Watson p-Wert (Autokorrelation): %.3f\n", dw$p.value))
  if (!is.null(shapiro)) cat(sprintf("Shapiro-Wilk p-Wert (Normalitaet Residuen): %.3f\n", shapiro$p.value))

  if (inferenz) {
    hac_test <- lmtest::coeftest(modell, vcov = sandwich::NeweyWest(modell))
    cat("Steigung (Newey-West-korrigiert):\n")
    print(hac_test["jahr", ])
  } else {
    cat("Hinweis: n zu klein fuer valide Inferenz (rein deskriptiv, SAP 7).\n")
  }

  neu <- data.frame(jahr = projektionsjahr)
  pi_ols <- predict(modell, newdata = neu, interval = "prediction", level = 0.95)

  cat(sprintf("OLS-Projektion %d: %.1f Mt  (95%%-PI: %.1f - %.1f)\n",
              projektionsjahr, pi_ols[1, "fit"], pi_ols[1, "lwr"], pi_ols[1, "upr"]))

  list(name = name, modell = modell, pi_ols = pi_ols, sub = sub)
}

ergebnisse <- mapply(function(n, f) analysiere_fenster(n, f$von, f$bis, inferenz = f$inferenz),
                      names(fenster), fenster, SIMPLIFY = FALSE)

# 4. Sensitivitaetsanalyse: ARIMA-Prognoseintervall (SAP 6.1) ---------------
arima_sensitivitaet <- function(von, bis, h_bis = 2040) {
  sub <- subset(df, jahr >= von & jahr <= bis)
  ts_obj <- ts(sub$emissionen, start = von, frequency = 1)
  fit <- forecast::auto.arima(ts_obj)
  h <- h_bis - bis
  fc <- forecast::forecast(fit, h = h, level = 95)
  punkt <- as.numeric(fc$mean[h])
  lwr <- as.numeric(fc$lower[h, 1])
  upr <- as.numeric(fc$upper[h, 1])
  cat(sprintf("\nARIMA (%s) Projektion %d: %.1f Mt  (95%%-PI: %.1f - %.1f)\n",
              paste0(fit$arma[c(1,6,2)], collapse=","), h_bis, punkt, lwr, upr))
  list(punkt = punkt, lwr = lwr, upr = upr, modell = fit)
}

cat("\n--- Sensitivitaetsanalyse: ARIMA statt OLS-PI ---\n")
arima_A <- arima_sensitivitaet(1990, 2025)
arima_B <- arima_sensitivitaet(2015, 2025)

# 5. Ergebnistabelle (SAP 10) -------------------------------------------------
tabelle <- data.frame(
  Fenster = c("A: 1990-2025 (OLS)", "A: 1990-2025 (ARIMA)",
              "B: 2015-2025 (OLS)", "B: 2015-2025 (ARIMA)"),
  Punktschaetzung = round(c(ergebnisse$A$pi_ols[1,"fit"], arima_A$punkt,
                              ergebnisse$B$pi_ols[1,"fit"], arima_B$punkt), 1),
  PI_unten = round(c(ergebnisse$A$pi_ols[1,"lwr"], arima_A$lwr,
                       ergebnisse$B$pi_ols[1,"lwr"], arima_B$lwr), 1),
  PI_oben = round(c(ergebnisse$A$pi_ols[1,"upr"], arima_A$upr,
                      ergebnisse$B$pi_ols[1,"upr"], arima_B$upr), 1)
)
tabelle$Ziel_2040_im_PI <- tabelle$PI_unten <= ziel_2040 & ziel_2040 <= tabelle$PI_oben
print(tabelle)

# 6. Grafik (SAP 10) ----------------------------------------------------------
projektion_df <- rbind(
  data.frame(jahr = c(2025, 2040), emissionen = c(648.83, ergebnisse$A$pi_ols[1,"fit"]),
             modell = "Langfrist-Trend (A, OLS)"),
  data.frame(jahr = c(2025, 2040), emissionen = c(648.83, ergebnisse$B$pi_ols[1,"fit"]),
             modell = "10-Jahres-Trend (B, OLS)")
)

p <- ggplot() +
  geom_line(data = df, aes(x = jahr, y = emissionen), color = "#2a78d6", linewidth = 1) +
  geom_line(data = projektion_df, aes(x = jahr, y = emissionen, linetype = modell,
             color = modell), linewidth = 0.8) +
  geom_ribbon(data = data.frame(jahr = c(2025, 2040),
                                  lwr = c(648.83, ergebnisse$B$pi_ols[1,"lwr"]),
                                  upr = c(648.83, ergebnisse$B$pi_ols[1,"upr"])),
              aes(x = jahr, ymin = lwr, ymax = upr), fill = "#1baf7a", alpha = 0.12) +
  geom_point(aes(x = 2040, y = ziel_2040), color = "#e34948", size = 3) +
  annotate("text", x = 2040, y = ziel_2040 - 40, label = "Zielpfad -88%",
           color = "#e34948", size = 3, hjust = 1) +
  labs(title = "Deutsche THG-Emissionen: historisch und Trendprojektion 2040",
       subtitle = "Quelle: Umweltbundesamt via klimadashboard.de | eigene Berechnung",
       x = NULL, y = "Mt CO2-Aequivalent", color = NULL, linetype = NULL) +
  theme_minimal(base_size = 11) +
  theme(legend.position = "bottom")

ggsave("output/emissionen_trendprojektion_2040.png", p, width = 7, height = 4.5, dpi = 200)
print(p)
