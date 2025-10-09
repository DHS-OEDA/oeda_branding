# oeda_plotly_themes.R
# OEDA plotly themes for interactive visualizations
# Companion to oeda_themes.R for ggplot2

library(plotly)

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

# OEDA Light Theme for Plotly
layout_oeda_light <- function(p, title = NULL, subtitle = NULL, 
                              font_family = "Noto Sans", font_size = 12) {
  
  # Build title with subtitle if provided
  title_text <- if (!is.null(subtitle)) {
    paste0("<b>", title, "</b><br><sub>", subtitle, "</sub>")
  } else if (!is.null(title)) {
    paste0("<b>", title, "</b>")
  } else {
    NULL
  }
  
  p %>%
    layout(
      # Overall font settings
      font = list(
        family = font_family,
        size = font_size,
        color = brand_colors$`ashland-charcoal`
      ),
      
      # Title styling
      title = if (!is.null(title_text)) {
        list(
          text = title_text,
          font = list(
            family = font_family,
            size = font_size * 1.3,
            color = brand_colors$`ashland-charcoal`
          ),
          x = 0,
          xanchor = "left"
        )
      } else {
        NULL
      },
      
      # Background colors
      plot_bgcolor = brand_colors$white,
      paper_bgcolor = brand_colors$white,
      
      # X-axis styling
      xaxis = list(
        title = list(
          font = list(
            family = font_family,
            color = brand_colors$`ashland-charcoal`
          )
        ),
        tickfont = list(
          family = font_family,
          color = brand_colors$`ashland-charcoal-80`
        ),
        gridcolor = brand_colors$`ashland-charcoal-20`,
        zerolinecolor = brand_colors$`ashland-charcoal-20`
      ),
      
      # Y-axis styling
      yaxis = list(
        title = list(
          font = list(
            family = font_family,
            color = brand_colors$`ashland-charcoal`
          )
        ),
        tickfont = list(
          family = font_family,
          color = brand_colors$`ashland-charcoal-80`
        ),
        gridcolor = brand_colors$`ashland-charcoal-20`,
        zerolinecolor = brand_colors$`ashland-charcoal-20`
      ),
      
      # Legend styling
      legend = list(
        font = list(
          family = font_family,
          color = brand_colors$`ashland-charcoal`
        ),
        bgcolor = brand_colors$white,
        bordercolor = brand_colors$`ashland-charcoal-20`,
        borderwidth = 1
      )
    )
}

# OEDA Dark Theme for Plotly
layout_oeda_dark <- function(p, title = NULL, subtitle = NULL,
                             font_family = "Noto Sans", font_size = 12) {
  
  # Build title with subtitle if provided
  title_text <- if (!is.null(subtitle)) {
    paste0("<b>", title, "</b><br><sub>", subtitle, "</sub>")
  } else if (!is.null(title)) {
    paste0("<b>", title, "</b>")
  } else {
    NULL
  }
  
  p %>%
    layout(
      # Overall font settings
      font = list(
        family = font_family,
        size = font_size,
        color = brand_colors$`fog-gray`
      ),
      
      # Title styling
      title = if (!is.null(title_text)) {
        list(
          text = title_text,
          font = list(
            family = font_family,
            size = font_size * 1.3,
            color = brand_colors$`north-star-indigo-40`
          ),
          x = 0,
          xanchor = "left"
        )
      } else {
        NULL
      },
      
      # Background colors
      plot_bgcolor = brand_colors$`ashland-charcoal`,
      paper_bgcolor = brand_colors$`ashland-charcoal`,
      
      # X-axis styling
      xaxis = list(
        title = list(
          font = list(
            family = font_family,
            color = brand_colors$`fog-gray`
          )
        ),
        tickfont = list(
          family = font_family,
          color = brand_colors$`fog-gray`
        ),
        gridcolor = brand_colors$`ashland-charcoal-80`,
        zerolinecolor = brand_colors$`ashland-charcoal-80`
      ),
      
      # Y-axis styling
      yaxis = list(
        title = list(
          font = list(
            family = font_family,
            color = brand_colors$`fog-gray`
          )
        ),
        tickfont = list(
          family = font_family,
          color = brand_colors$`fog-gray`
        ),
        gridcolor = brand_colors$`ashland-charcoal-80`,
        zerolinecolor = brand_colors$`ashland-charcoal-80`
      ),
      
      # Legend styling
      legend = list(
        font = list(
          family = font_family,
          color = brand_colors$`fog-gray`
        ),
        bgcolor = brand_colors$`ashland-charcoal`,
        bordercolor = brand_colors$`ashland-charcoal-80`,
        borderwidth = 1
      )
    )
}

# Color palettes for plotly
oeda_colors_primary <- c(
  brand_colors$`north-star-indigo`,
  brand_colors$`glacial-blue`,
  brand_colors$`forest-green`, 
  brand_colors$`marionberry-red`,
  brand_colors$`harvest-gold`,
  brand_colors$`willamette-green`
)

oeda_colors_cool <- c(
  brand_colors$`north-star-indigo`,
  brand_colors$`glacial-blue`,
  brand_colors$`forest-green`,
  brand_colors$`mist-grey`
)

oeda_colors_warm <- c(
  brand_colors$`marionberry-red`,
  brand_colors$`harvest-gold`,
  brand_colors$`desert-sand`, 
  brand_colors$`willamette-green`
)

# Convenience function to hide modebar
config_oeda <- function(p) {
  p %>% config(displayModeBar = FALSE)
}