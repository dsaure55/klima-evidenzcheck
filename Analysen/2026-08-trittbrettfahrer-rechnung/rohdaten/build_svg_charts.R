# Erzeugt statische SVG-Konzentrationskurven fuer den Substack-Entwurf direkt
# aus den validierten Output-CSVs. Reine Text-Ausgabe (cat/writeLines) - kein
# R-Grafikgeraet involviert, daher nicht vom bekannten png()/pdf()-Segfault-
# Defekt dieser R-Installation betroffen (siehe DATENAUFBEREITUNG_LOG.txt).

de_fmt1 <- function(x) sub("\\.", ",", sprintf("%.1f", x))

build_svg <- function(csv_path, de_rank, de_share_pct, de_cum_pct, n_total,
                       title, subtitle, out_path, x_label) {
  d <- read.csv(csv_path, stringsAsFactors = FALSE)
  d <- d[order(d$rank), ]

  W <- 800; H <- 460
  ml <- 66; mr <- 24; mt <- 30; mb <- 60
  pw <- W - ml - mr; ph <- H - mt - mb

  x_of <- function(rank) ml + (rank - 1) / (n_total - 1) * pw
  y_of <- function(share) mt + (1 - share) * ph

  pts <- sprintf("%.2f,%.2f", x_of(d$rank), y_of(d$cum_share))
  path_line <- paste("M", pts[1], "L", paste(pts[-1], collapse = " "))
  area_pts <- c(pts, sprintf("%.2f,%.2f", x_of(max(d$rank)), y_of(0)),
                sprintf("%.2f,%.2f", x_of(1), y_of(0)))
  path_area <- paste("M", paste(area_pts, collapse = " "), "Z")

  de_x <- x_of(de_rank); de_y <- y_of(de_cum_pct / 100)

  grid_y <- c(0, 25, 50, 75, 100)
  gridlines <- paste(sprintf(
    '<line x1="%.1f" y1="%.1f" x2="%.1f" y2="%.1f" stroke="#e1e0d9" stroke-width="1"/>
     <text x="%.1f" y="%.1f" font-size="12" fill="#898781" text-anchor="end" font-family="system-ui,-apple-system,\'Segoe UI\',sans-serif">%d%%</text>',
    ml, y_of(grid_y / 100), W - mr, y_of(grid_y / 100), ml - 10, y_of(grid_y / 100) + 4, grid_y
  ), collapse = "\n")

  x_ticks <- c(1, round(n_total * 0.25), round(n_total * 0.5), round(n_total * 0.75), n_total)
  xticklabels <- paste(sprintf(
    '<text x="%.1f" y="%.1f" font-size="12" fill="#898781" text-anchor="middle" font-family="system-ui,-apple-system,\'Segoe UI\',sans-serif">%d</text>',
    x_of(x_ticks), H - mb + 20, x_ticks
  ), collapse = "\n")

  svg <- sprintf('<svg viewBox="0 0 %d %d" xmlns="http://www.w3.org/2000/svg" font-family="system-ui,-apple-system,\'Segoe UI\',sans-serif">
  <rect x="0" y="0" width="%d" height="%d" fill="#fcfcfb"/>
  <text x="%d" y="20" font-size="16" font-weight="600" fill="#0b0b0b">%s</text>
  <text x="%d" y="%d" font-size="12" fill="#52514e">%s</text>
  %s
  <path d="%s" fill="#2a78d6" fill-opacity="0.12" stroke="none"/>
  <path d="%s" fill="none" stroke="#2a78d6" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round"/>
  <line x1="%.2f" y1="%.2f" x2="%.2f" y2="%.2f" stroke="#898781" stroke-width="1" stroke-dasharray="3,3"/>
  <line x1="%.2f" y1="%.2f" x2="%.2f" y2="%.2f" stroke="#898781" stroke-width="1" stroke-dasharray="3,3"/>
  <circle cx="%.2f" cy="%.2f" r="6" fill="#eb6834" stroke="#fcfcfb" stroke-width="2"/>
  <text x="%.2f" y="%.2f" font-size="13" font-weight="600" fill="#0b0b0b" text-anchor="%s">Deutschland (Rang %d)</text>
  <text x="%.2f" y="%.2f" font-size="12" fill="#52514e" text-anchor="%s">Anteil %s%% \u00b7 Top-%d-Kurve bei %s%%</text>
  %s
  <text x="%d" y="%d" font-size="12" fill="#898781" text-anchor="middle">%s</text>
  <text transform="rotate(-90)" x="%d" y="18" font-size="12" fill="#898781" text-anchor="middle">Kumulierter Anteil an Welt-Emissionen</text>
</svg>',
    W, H, W, H,
    ml, title,
    ml, mt + 16, subtitle,
    gridlines,
    path_area,
    path_line,
    de_x, de_y, de_x, H - mb, # vertical guide
    ml, de_y, de_x, de_y,      # horizontal guide
    de_x, de_y,
    if (de_x > W * 0.62) de_x - 12 else de_x + 12, de_y - 14,
    if (de_x > W * 0.62) "end" else "start", de_rank,
    if (de_x > W * 0.62) de_x - 12 else de_x + 12, de_y + 4,
    if (de_x > W * 0.62) "end" else "start", de_fmt1(de_share_pct), de_rank, de_fmt1(de_cum_pct),
    xticklabels,
    ml + pw / 2, H - 16, x_label,
    -(mt + ph / 2)
  )
  writeLines(svg, out_path)
  cat("Geschrieben:", out_path, "\n")
}

base <- "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-08-trittbrettfahrer-rechnung"

build_svg(
  csv_path = file.path(base, "output/estimand1a_konzentrationskurve_edgar_2024.csv"),
  de_rank = 12, de_share_pct = 1.3, de_cum_pct = 69.6, n_total = 208,
  title = "Konzentrationskurve: aktuelle Jahresemissionen (2024)",
  subtitle = "EDGAR, alle Treibhausgase in CO2-\u00c4q. \u00b7 L\u00e4nder absteigend nach Anteil sortiert",
  out_path = file.path(base, "../../Reports/2026-08-trittbrettfahrer-rechnung/kanal-entwuerfe/assets/konzentrationskurve_2024.svg"),
  x_label = "Anzahl L\u00e4nder (gr\u00f6\u00dfte zuerst)"
)

build_svg(
  csv_path = file.path(base, "output/estimand1b_konzentrationskurve_gcb_kumuliert.csv"),
  de_rank = 4, de_share_pct = 5.3, de_cum_pct = 52.1, n_total = 214,
  title = "Konzentrationskurve: kumulierte historische Emissionen (1850\u20132024)",
  subtitle = "Global Carbon Project, fossile CO2-Emissionen + Zement \u00b7 L\u00e4nder absteigend nach Anteil sortiert",
  out_path = file.path(base, "../../Reports/2026-08-trittbrettfahrer-rechnung/kanal-entwuerfe/assets/konzentrationskurve_historisch.svg"),
  x_label = "Anzahl L\u00e4nder (gr\u00f6\u00dfte zuerst)"
)
