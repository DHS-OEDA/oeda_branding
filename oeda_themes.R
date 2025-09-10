# oeda_themes.R
# OEDA ggplot2 themes and color palettes

library(ggplot2)
library(svglite)
library(knitr)

# Color palette definitions
oeda_colors <- list(
  # Primary colors
  "north_star_indigo" = "#2E3192",
  "glacial_blue" = "#B4DCF5", 
  "fog_gray" = "#F4F2ED",
  
  # Secondary colors
  "forest_green" = "#184E49",
  "willamette_green" = "#86C679",
  "mist_grey" = "#D8E1E5",
  
  # Tertiary colors
  "marionberry_red" = "#A91F50",
  "harvest_gold" = "#ECD263",
  "desert_sand" = "#EDDFD4",
  "ashland_charcoal" = "#414042",
  
  # Tints for dark mode
  "north_star_indigo_40" = "#ACADD3",
  "north_star_indigo_60" = "#8283BE",
  "forest_green_60" = "#749592",
  "harvest_gold_60" = "#F3E2A1",
  "marionberry_red_60" = "#CB6996",
  "glacial_blue_60" = "#D1EAF9",
  "ashland_charcoal_80" = "#676668",
  "ashland_charcoal_20" = "#D9D9D9"
)

# Define color palettes
oeda_palettes <- list(
  primary = c(oeda_colors$north_star_indigo, oeda_colors$glacial_blue, oeda_colors$forest_green),
  secondary = c(oeda_colors$willamette_green, oeda_colors$harvest_gold, oeda_colors$marionberry_red),
  cool = c(oeda_colors$north_star_indigo, oeda_colors$glacial_blue, oeda_colors$forest_green, oeda_colors$mist_grey),
  warm = c(oeda_colors$marionberry_red, oeda_colors$harvest_gold, oeda_colors$desert_sand),
  full = c(oeda_colors$north_star_indigo, oeda_colors$forest_green, oeda_colors$marionberry_red, 
           oeda_colors$harvest_gold, oeda_colors$glacial_blue, oeda_colors$willamette_green)
)

# Color scale functions
scale_color_oeda_discrete <- function(palette = "primary", ...) {
  ggplot2::scale_color_manual(values = oeda_palettes[[palette]], ...)
}

scale_fill_oeda_discrete <- function(palette = "primary", ...) {
  ggplot2::scale_fill_manual(values = oeda_palettes[[palette]], ...)
}

# OEDA Light Theme
theme_oeda_light <- function(base_size = 11, base_family = "sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Background
      plot.background = element_rect(fill = "white", color = NA),
      panel.background = element_rect(fill = "white", color = NA),
      
      # Text
      text = element_text(color = oeda_colors$ashland_charcoal, family = base_family),
      plot.title = element_text(
        color = oeda_colors$north_star_indigo, 
        face = "bold", 
        size = rel(1.3),
        margin = margin(b = 10)
      ),
      plot.subtitle = element_text(
        color = oeda_colors$ashland_charcoal_80,
        size = rel(1.1),
        margin = margin(b = 15)
      ),
      plot.caption = element_text(
        color = oeda_colors$ashland_charcoal_80,
        size = rel(0.9),
        hjust = 0,
        margin = margin(t = 10)
      ),
      
      # Axes
      axis.text = element_text(color = oeda_colors$ashland_charcoal),
      axis.title = element_text(color = oeda_colors$ashland_charcoal, face = "bold"),
      
      # Grid
      panel.grid.major = element_line(color = oeda_colors$ashland_charcoal_20, size = 0.5),
      panel.grid.minor = element_line(color = oeda_colors$ashland_charcoal_20, size = 0.25),
      
      # Legend
      legend.text = element_text(color = oeda_colors$ashland_charcoal),
      legend.title = element_text(color = oeda_colors$ashland_charcoal, face = "bold"),
      legend.background = element_rect(fill = "white", color = NA),
      
      # Facets
      strip.background = element_rect(fill = oeda_colors$fog_gray, color = NA),
      strip.text = element_text(color = oeda_colors$ashland_charcoal, face = "bold"),
      
      # Margins
      plot.margin = margin(20, 20, 20, 20)
    )
}

# OEDA Dark Theme  
theme_oeda_dark <- function(base_size = 11, base_family = "sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Background
      plot.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      panel.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      
      # Text
      text = element_text(color = oeda_colors$fog_gray, family = base_family),
      plot.title = element_text(
        color = oeda_colors$north_star_indigo_40,
        face = "bold",
        size = rel(1.3),
        margin = margin(b = 10)
      ),
      plot.subtitle = element_text(
        color = oeda_colors$fog_gray,
        size = rel(1.1),
        margin = margin(b = 15)
      ),
      plot.caption = element_text(
        color = oeda_colors$ashland_charcoal_80,
        size = rel(0.9),
        hjust = 0,
        margin = margin(t = 10)
      ),
      
      # Axes
      axis.text = element_text(color = oeda_colors$fog_gray),
      axis.title = element_text(color = oeda_colors$fog_gray, face = "bold"),
      
      # Grid
      panel.grid.major = element_line(color = oeda_colors$ashland_charcoal_80, size = 0.5),
      panel.grid.minor = element_line(color = oeda_colors$ashland_charcoal_80, size = 0.25),
      
      # Legend
      legend.text = element_text(color = oeda_colors$fog_gray),
      legend.title = element_text(color = oeda_colors$fog_gray, face = "bold"),
      legend.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      
      # Facets
      strip.background = element_rect(fill = oeda_colors$ashland_charcoal_80, color = NA),
      strip.text = element_text(color = oeda_colors$fog_gray, face = "bold"),
      
      # Margins
      plot.margin = margin(20, 20, 20, 20)
    )
}

# Dark SVG device function
darksvglite <- function(filename = "plot.dark.svg", width = 7, height = 7, pointsize = 12, ...) {
  svglite(
    filename = filename,
    width = width, 
    height = height,
    pointsize = pointsize,
    bg = oeda_colors$ashland_charcoal,
    ...
  )
}

# Function to save dual plots (alternative method)
save_dual_plots <- function(plot_obj, base_name, width = 8, height = 6, path = ".", ...) {
  # Save light version
  light_file <- file.path(path, paste0(base_name, ".light.svg"))
  ggsave(
    filename = light_file,
    plot = plot_obj + theme_oeda_light(),
    device = "svg",
    width = width,
    height = height,
    bg = "white",
    ...
  )
  
  # Save dark version
  dark_file <- file.path(path, paste0(base_name, ".dark.svg"))
  ggsave(
    filename = dark_file,
    plot = plot_obj + theme_oeda_dark(),
    device = "svg", 
    width = width,
    height = height,
    bg = oeda_colors$ashland_charcoal,
    ...
  )
  
  # Return the light version for display
  plot_obj + theme_oeda_light()
}


## Alternative approach to the knitr-only approach taken from https://mickael.canouil.fr/posts/2023-05-30-quarto-light-dark/
# Custom knit_print method for ggplot objects
knit_print.ggplot <- function(x, options, ...) {
  
  # Get the current chunk label for unique naming
  chunk_label <- options$label %||% "unnamed-chunk"
  
  # Create light version
  light_plot <- x + theme_oeda_light()
  
  # Create dark version  
  dark_plot <- x + theme_oeda_dark()
  
  # Generate unique filenames
  light_file <- paste0(chunk_label, "-light.svg")
  dark_file <- paste0(chunk_label, "-dark.svg")
  
  # Save light version
  ggsave(
    filename = light_file,
    plot = light_plot,
    device = "svg",
    width = options$fig.width %||% 8,
    height = options$fig.height %||% 6,
    bg = "white"
  )
  
  # Save dark version
  ggsave(
    filename = dark_file,
    plot = dark_plot, 
    device = "svg",
    width = options$fig.width %||% 8,
    height = options$fig.height %||% 6,
    bg = oeda_colors$ashland_charcoal
  )
  
  # Create HTML output with both images
  html_output <- paste0(
    '<div class="plot-container">\n',
    '  <img src="', light_file, '" class="plot-light" style="width: 100%; height: auto;" />\n',
    '  <img src="', dark_file, '" class="plot-dark" style="width: 100%; height: auto; display: none;" />\n',
    '</div>\n'
  )
  
  knitr::asis_output(html_output)
}

# Register the method
registerS3method("knit_print", "ggplot", knit_print.ggplot)