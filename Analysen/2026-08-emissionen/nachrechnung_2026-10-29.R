# Nachrechnung 29.10.2026 fuer Korrekturvermerk zum Artikel vom 27.08.2026
# Zweck: ungerundete Prognoseintervalle (OLS) und Vergleich klassischer vs. Newey-West-Standardfehler der Steigung.
# Keine neue Analyse; Daten und Verfahren wie DE-Emissionen-Trendprojektion-2040.R.
library(sandwich); library(lmtest)
e <- c(1252.94,1206.27,1157.88,1148.42,1130.77,1123.36,1140.15,1104.73,1079.92,1045.47,1042.91,1056.99,1036.54,1030.42,1010.54,988.70,1001.96,963.47,964.88,901.24,933.21,907.57,916.90,936.57,895.19,898.56,898.99,886.24,850.10,797.96,730.93,762.74,749.23,669.54,649.74,648.83)
d <- data.frame(jahr = 1990:2025, emissionen = e)
for (f in list(c(1990, 2025), c(2015, 2025), c(2020, 2025))) {
  m <- lm(emissionen ~ jahr, data = subset(d, jahr >= f[1] & jahr <= f[2]))
  pi <- predict(m, data.frame(jahr = 2040), interval = "prediction", level = 0.95)
  cat(sprintf("\nFenster %d-%d: Projektion 2040 %.3f, 95%%-PI %.3f bis %.3f\n", f[1], f[2], pi[1, 1], pi[1, 2], pi[1, 3]))
  se_ols <- sqrt(vcov(m)["jahr", "jahr"])
  se_nw  <- sqrt(sandwich::NeweyWest(m)["jahr", "jahr"])
  print(summary(m)$coefficients["jahr", ])
  cat(sprintf("Steigung %.4f; SE klassisch %.4f; SE Newey-West %.4f; DW p %.3f\n", coef(m)["jahr"], se_ols, se_nw, lmtest::dwtest(m)$p.value))
}
print(sessionInfo()$R.version$version.string)
