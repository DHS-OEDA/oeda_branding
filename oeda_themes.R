# oeda_themes.R
# OEDA ggplot2 themes optimized for Quarto 1.7 renderings
# Updated to work with the new renderings: [light, dark] approach

library(ggplot2)

# Load brand colors from _brand.yml (you may need to adjust path)
if (file.exists("_brand.yml")) {
  brand_colors <- yaml::read_yaml("_brand.yml")$color$palette
} else {
  # Fallback color definitions
  brand_colors <- list(
    `north-star-indigo` = "#2E3192",
    `glacial-blue` = "#B4DCF5", 
    `fog-gray` = "#F4F2ED",
    `forest-green` = "#184E49",
    `willamette-green` = "#86C679",
    `mist-grey` = "#D8E1E5",
    `marionberry-red` = "#A91F50",
    `harvest-gold` = "#ECD263",
    `desert-sand` = "#EDDFD4",
    `ashland-charcoal` = "#414042",
    `white` = "#FFFFFF",
    `black` = "#000000",
    # Tints for dark mode
    `north-star-indigo-40` = "#ACADD3",
    `north-star-indigo-60` = "#8283BE",
    `ashland-charcoal-80` = "#676668",
    `ashland-charcoal-20` = "#D9D9D9"
  )
}

# OEDA Light Theme
theme_oeda_light <- function(base_size = 11, base_family = "sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Background colors
      plot.background = element_rect(fill = brand_colors$white, color = NA),
      panel.background = element_rect(fill = brand_colors$white, color = NA),
      strip.background = element_rect(fill = brand_colors$`fog-gray`, color = NA),
      
      # Text colors
      text = element_text(color = brand_colors$`ashland-charcoal`),
      plot.title = element_text(
        color = brand_colors$`north-star-indigo`,
        face = "bold",
        size = rel(1.3),
        margin = margin(b = 12)
      ),
      plot.subtitle = element_text(
        color = brand_colors$`ashland-charcoal-80`,
        size = rel(1.1),
        margin = margin(b = 12)
      ),
      plot.caption = element_text(
        color = brand_colors$`ashland-charcoal-80`,
        size = rel(0.8),
        hjust = 0,
        margin = margin(t = 12)
      ),
      axis.title = element_text(color = brand_colors$`ashland-charcoal`),
      axis.text = element_text(color = brand_colors$`ashland-charcoal-80`),
      
      # Grid and panel elements
      panel.grid.major = element_line(color = brand_colors$`ashland-charcoal-20`, linewidth = 0.3),
      panel.grid.minor = element_line(color = brand_colors$`ashland-charcoal-20`, linewidth = 0.15),
      
      # Legend
      legend.background = element_rect(fill = brand_colors$white, color = NA),
      legend.text = element_text(color = brand_colors$`ashland-charcoal`),
      legend.title = element_text(color = brand_colors$`ashland-charcoal`, face = "bold"),
      
      # Facet strips
      strip.text = element_text(
        color = brand_colors$`ashland-charcoal`,
        face = "bold",
        size = rel(0.9)
      )
    )
}

# OEDA Dark Theme  
theme_oeda_dark <- function(base_size = 11, base_family = "sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Background colors
      plot.background = element_rect(fill = brand_colors$`ashland-charcoal`, color = NA),
      panel.background = element_rect(fill = brand_colors$`ashland-charcoal`, color = NA),
      strip.background = element_rect(fill = brand_colors$`ashland-charcoal-80`, color = NA),
      
      # Text colors
      text = element_text(color = brand_colors$`fog-gray`),
      plot.title = element_text(
        color = brand_colors$`north-star-indigo-40`,
        face = "bold", 
        size = rel(1.3),
        margin = margin(b = 12)
      ),
      plot.subtitle = element_text(
        color = brand_colors$`fog-gray`,
        size = rel(1.1),
        margin = margin(b = 12)
      ),
      plot.caption = element_text(
        color = brand_colors$`fog-gray`,
        size = rel(0.8),
        hjust = 0,
        margin = margin(t = 12)
      ),
      axis.title = element_text(color = brand_colors$`fog-gray`),
      axis.text = element_text(color = brand_colors$`fog-gray`),
      
      # Grid and panel elements
      panel.grid.major = element_line(color = brand_colors$`ashland-charcoal-80`, linewidth = 0.3),
      panel.grid.minor = element_line(color = brand_colors$`ashland-charcoal-80`, linewidth = 0.15),
      
      # Legend
      legend.background = element_rect(fill = brand_colors$`ashland-charcoal`, color = NA),
      legend.text = element_text(color = brand_colors$`fog-gray`),
      legend.title = element_text(color = brand_colors$`fog-gray`, face = "bold"),
      
      # Facet strips
      strip.text = element_text(
        color = brand_colors$`fog-gray`,
        face = "bold",
        size = rel(0.9)
      )
    )
}

# Color scale functions (unchanged)
scale_color_oeda_discrete <- function(palette = "primary", ...) {
  switch(palette,
    "primary" = scale_color_manual(values = c(
      brand_colors$`north-star-indigo`,
      brand_colors$`glacial-blue`, 
      brand_colors$`forest-green`,
      brand_colors$`marionberry-red`,
      brand_colors$`harvest-gold`,
      brand_colors$`willamette-green`
    ), ...),
    "cool" = scale_color_manual(values = c(
      brand_colors$`north-star-indigo`,
      brand_colors$`glacial-blue`,
      brand_colors$`forest-green`,
      brand_colors$`mist-grey`
    ), ...),
    "warm" = scale_color_manual(values = c(
      brand_colors$`marionberry-red`,
      brand_colors$`harvest-gold`, 
      brand_colors$`desert-sand`,
      brand_colors$`willamette-green`
    ), ...)
  )
}

scale_fill_oeda_discrete <- function(palette = "primary", ...) {
  switch(palette,
    "primary" = scale_fill_manual(values = c(
      brand_colors$`north-star-indigo`,
      brand_colors$`glacial-blue`,
      brand_colors$`forest-green`, 
      brand_colors$`marionberry-red`,
      brand_colors$`harvest-gold`,
      brand_colors$`willamette-green`
    ), ...),
    "cool" = scale_fill_manual(values = c(
      brand_colors$`north-star-indigo`,
      brand_colors$`glacial-blue`,
      brand_colors$`forest-green`,
      brand_colors$`mist-grey`
    ), ...),
    "warm" = scale_fill_manual(values = c(
      brand_colors$`marionberry-red`,
      brand_colors$`harvest-gold`,
      brand_colors$`desert-sand`, 
      brand_colors$`willamette-green`
    ), ...)
  )
}

