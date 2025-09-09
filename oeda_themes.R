# OEDA ggplot2 Light and Dark Themes
# Oregon Enterprise Data Analytics Brand Colors and Themes

# Load required libraries
library(ggplot2)
library(yaml)

# Define OEDA Brand Colors
# Primary Palette
oeda_colors <- list(
  # Primary
  north_star_indigo = "#2E3192",
  glacial_blue = "#B4DCF5", 
  fog_gray = "#F4F2ED",
  
  # Secondary
  forest_green = "#184E49",
  willamette_green = "#86C679",
  mist_grey = "#D8E1E5",
  
  # Tertiary
  marionberry_red = "#A91F50",
  harvest_gold = "#ECD263",
  desert_sand = "#EDDFD4",
  ashland_charcoal = "#414042",
  white = "#FFFFFF",
  black = "#000000",
  
  # Tints for dark mode
  north_star_indigo_40 = "#ACADD3",
  north_star_indigo_60 = "#8283BE",
  ashland_charcoal_80 = "#676668",
  ashland_charcoal_20 = "#D9D9D9"
)

# OEDA Light Theme
theme_oeda_light <- function(base_size = 11, base_family = "Noto Sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Plot background and panel
      plot.background = element_rect(fill = oeda_colors$white, color = NA),
      panel.background = element_rect(fill = oeda_colors$white, color = NA),
      panel.grid.major = element_line(color = oeda_colors$ashland_charcoal_20, 
                                      size = 0.25),
      panel.grid.minor = element_line(color = oeda_colors$ashland_charcoal_20, 
                                      size = 0.1),
      
      # Text elements
      text = element_text(color = oeda_colors$ashland_charcoal, 
                         family = base_family),
      plot.title = element_text(color = oeda_colors$north_star_indigo,
                               face = "bold",
                               size = rel(1.2),
                               hjust = 0,
                               margin = margin(b = 10)),
      plot.subtitle = element_text(color = oeda_colors$ashland_charcoal,
                                  size = rel(1.0),
                                  hjust = 0,
                                  margin = margin(b = 15)),
      plot.caption = element_text(color = oeda_colors$ashland_charcoal_80,
                                 size = rel(0.8),
                                 hjust = 1),
      
      # Axis elements
      axis.title = element_text(color = oeda_colors$ashland_charcoal,
                               size = rel(0.9)),
      axis.text = element_text(color = oeda_colors$ashland_charcoal,
                              size = rel(0.8)),
      axis.line = element_line(color = oeda_colors$ashland_charcoal,
                              size = 0.5),
      axis.ticks = element_line(color = oeda_colors$ashland_charcoal,
                               size = 0.25),
      
      # Legend
      legend.background = element_rect(fill = oeda_colors$white, color = NA),
      legend.key = element_rect(fill = oeda_colors$white, color = NA),
      legend.text = element_text(color = oeda_colors$ashland_charcoal,
                                size = rel(0.8)),
      legend.title = element_text(color = oeda_colors$ashland_charcoal,
                                 size = rel(0.9)),
      
      # Strip (facet labels)
      strip.background = element_rect(fill = oeda_colors$fog_gray, 
                                     color = oeda_colors$ashland_charcoal_20),
      strip.text = element_text(color = oeda_colors$north_star_indigo,
                               face = "bold",
                               size = rel(0.9)),
      
      # Margins
      plot.margin = margin(20, 20, 20, 20)
    )
}

# OEDA Dark Theme
theme_oeda_dark <- function(base_size = 11, base_family = "Noto Sans") {
  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Plot background and panel
      plot.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      panel.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      panel.grid.major = element_line(color = oeda_colors$ashland_charcoal_80, 
                                      size = 0.25),
      panel.grid.minor = element_line(color = oeda_colors$ashland_charcoal_80, 
                                      size = 0.1),
      
      # Text elements
      text = element_text(color = oeda_colors$fog_gray, 
                         family = base_family),
      plot.title = element_text(color = oeda_colors$north_star_indigo_40,
                               face = "bold",
                               size = rel(1.2),
                               hjust = 0,
                               margin = margin(b = 10)),
      plot.subtitle = element_text(color = oeda_colors$fog_gray,
                                  size = rel(1.0),
                                  hjust = 0,
                                  margin = margin(b = 15)),
      plot.caption = element_text(color = oeda_colors$ashland_charcoal_20,
                                 size = rel(0.8),
                                 hjust = 1),
      
      # Axis elements
      axis.title = element_text(color = oeda_colors$fog_gray,
                               size = rel(0.9)),
      axis.text = element_text(color = oeda_colors$fog_gray,
                              size = rel(0.8)),
      axis.line = element_line(color = oeda_colors$fog_gray,
                              size = 0.5),
      axis.ticks = element_line(color = oeda_colors$fog_gray,
                               size = 0.25),
      
      # Legend
      legend.background = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      legend.key = element_rect(fill = oeda_colors$ashland_charcoal, color = NA),
      legend.text = element_text(color = oeda_colors$fog_gray,
                                size = rel(0.8)),
      legend.title = element_text(color = oeda_colors$fog_gray,
                                 size = rel(0.9)),
      
      # Strip (facet labels)
      strip.background = element_rect(fill = oeda_colors$ashland_charcoal_80, 
                                     color = oeda_colors$ashland_charcoal_20),
      strip.text = element_text(color = oeda_colors$north_star_indigo_40,
                               face = "bold",
                               size = rel(0.9)),
      
      # Margins
      plot.margin = margin(20, 20, 20, 20)
    )
}

# OEDA Color Palette Functions
scale_color_oeda_discrete <- function(palette = "primary", ...) {
  if (palette == "primary") {
    colors <- c(oeda_colors$north_star_indigo, 
                oeda_colors$willamette_green,
                oeda_colors$marionberry_red, 
                oeda_colors$harvest_gold,
                oeda_colors$glacial_blue,
                oeda_colors$forest_green)
  } else if (palette == "secondary") {
    colors <- c(oeda_colors$forest_green,
                oeda_colors$mist_grey,
                oeda_colors$desert_sand)
  } else if (palette == "cool") {
    colors <- c(oeda_colors$north_star_indigo,
                oeda_colors$glacial_blue,
                oeda_colors$forest_green,
                oeda_colors$mist_grey)
  } else if (palette == "warm") {
    colors <- c(oeda_colors$marionberry_red,
                oeda_colors$harvest_gold,
                oeda_colors$desert_sand,
                oeda_colors$willamette_green)
  }
  
  scale_color_manual(values = colors, ...)
}

scale_fill_oeda_discrete <- function(palette = "primary", ...) {
  if (palette == "primary") {
    colors <- c(oeda_colors$north_star_indigo, 
                oeda_colors$willamette_green,
                oeda_colors$marionberry_red, 
                oeda_colors$harvest_gold,
                oeda_colors$glacial_blue,
                oeda_colors$forest_green)
  } else if (palette == "secondary") {
    colors <- c(oeda_colors$forest_green,
                oeda_colors$mist_grey,
                oeda_colors$desert_sand)
  } else if (palette == "cool") {
    colors <- c(oeda_colors$north_star_indigo,
                oeda_colors$glacial_blue,
                oeda_colors$forest_green,
                oeda_colors$mist_grey)
  } else if (palette == "warm") {
    colors <- c(oeda_colors$marionberry_red,
                oeda_colors$harvest_gold,
                oeda_colors$desert_sand,
                oeda_colors$willamette_green)
  }
  
  scale_fill_manual(values = colors, ...)
}

# Continuous color scales
scale_color_oeda_continuous <- function(palette = "primary", ...) {
  if (palette == "primary") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$north_star_indigo)
  } else if (palette == "green") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$forest_green)
  } else if (palette == "red") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$marionberry_red)
  }
  
  scale_color_gradient(low = colors[1], high = colors[2], ...)
}

scale_fill_oeda_continuous <- function(palette = "primary", ...) {
  if (palette == "primary") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$north_star_indigo)
  } else if (palette == "green") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$forest_green)
  } else if (palette == "red") {
    colors <- c(oeda_colors$fog_gray, oeda_colors$marionberry_red)
  }
  
  scale_fill_gradient(low = colors[1], high = colors[2], ...)
}

# Example usage and demonstration
if (FALSE) {
  # Example data
  library(ggplot2)
  data(mtcars)
  
  # Light theme example
  p_light <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
    geom_point(size = 3) +
    labs(
      title = "OEDA Light Theme Example",
      subtitle = "Fuel efficiency vs weight by number of cylinders",
      x = "Weight (1000 lbs)",
      y = "Miles per gallon",
      color = "Cylinders",
      caption = "Data source: mtcars dataset"
    ) +
    theme_oeda_light() +
    scale_color_oeda_discrete(palette = "primary")
  
  # Dark theme example
  p_dark <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
    geom_point(size = 3) +
    labs(
      title = "OEDA Dark Theme Example",
      subtitle = "Fuel efficiency vs weight by number of cylinders",
      x = "Weight (1000 lbs)",
      y = "Miles per gallon",
      color = "Cylinders",
      caption = "Data source: mtcars dataset"
    ) +
    theme_oeda_dark() +
    scale_color_oeda_discrete(palette = "primary")
  
  print(p_light)
  print(p_dark)
}