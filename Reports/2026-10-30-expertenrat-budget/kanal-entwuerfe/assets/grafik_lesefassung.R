# Lesefassung der Grafik estimand2_overshoot.png (nur Layout, gleiche Werte)
# Daten: Analysen/2026-08-expertenrat-budgetabgleich/output/estimand2_tabelle.csv
library(ggplot2)
args <- commandArgs(trailingOnly = TRUE)
d <- read.csv(args[1], fileEncoding = "UTF-8")
fen <- c(A = "Langfrist 1990–2025", B = "10 Jahre 2015–2025", C = "kurz 2020–2025 (nur beschreibend)")
weg <- function(m) ifelse(grepl("Bootstrap", m), "Bootstrap", ifelse(grepl("ARIMA", m), "ARIMA", "Trendgerade"))
d$label <- paste0(fen[d$Fenster], " · ", weg(d$Methode))
d$art <- ifelse(grepl("ARIMA", d$Methode), "Bereich der tatsächlichen Summe (ARIMA)", "Bereich des Trends (Trendgerade, Bootstrap)")
d$label <- factor(d$label, levels = rev(d$label))
cat(sprintf("%s: %.0f [%.0f; %.0f]\n", d$label, d$Overshoot_eigen, d$Overshoot_Intervall_unten, d$Overshoot_Intervall_oben), sep = "")
p <- ggplot(d, aes(y = label)) +
  annotate("rect", xmin = 60, xmax = 100, ymin = -Inf, ymax = Inf, fill = "#F26B5B", alpha = 0.25) +
  geom_vline(xintercept = 0, linewidth = 0.6) +
  geom_errorbarh(aes(xmin = Overshoot_Intervall_unten, xmax = Overshoot_Intervall_oben, colour = art), height = 0.3, linewidth = 0.9) +
  geom_point(aes(x = Overshoot_eigen, colour = art), size = 3) +
  scale_colour_manual(values = c("#2A7FD4", "#1BA37A"), name = NULL) +
  scale_x_continuous(breaks = seq(-400, 1200, 200), expand = expansion(mult = c(0.02, 0.06))) +
  annotate("text", x = 108, y = 9.6, label = "← Expertenrat: 60 bis 100", size = 3.6, hjust = 0, vjust = 0) +
  annotate("text", x = -10, y = 9.6, label = "Budget eingehalten ←", size = 3.6, hjust = 1, vjust = 0) +
  coord_cartesian(ylim = c(0.6, 10.3), clip = "off") +
  labs(title = "Wie weit über dem Budget 2021–2030? Unsere Trendfortschreibungen",
       subtitle = "Punkt = fortgeschriebene Überschreitung, Balken = 95-Prozent-Bereich.\nNull = Budget von 6199 Mio. t genau eingehalten. Projektionsdaten 2026: Puffer 4,5 (praktisch auf der Nulllinie).",
       x = "Überschreitung des Budgets 2021–2030 in Mio. t CO2-Äquivalent (negativ = eingehalten)", y = NULL,
       caption = "Quelle: UBA via klimadashboard.de, Expertenrat für Klimafragen; eigene Berechnung (Klima Kompass)") +
  theme_minimal(base_size = 12) + theme(legend.position = "bottom", plot.title.position = "plot")
ggsave(args[2], p, width = 10, height = 6.5, dpi = 150, bg = "white")
