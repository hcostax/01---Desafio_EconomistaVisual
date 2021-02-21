# https://rpubs.com/mclaire19/ggplot2-custom-themes


# building a theme plot


library(tidyverse)       # collection of packages
library(scales)          # Scale Functions for Visualization


# ------

# Define liberum_theme() function

custom_theme <- function(){
  
  font <- "Teko"            # assign font family up front
  # https://fonts.google.com/specimen/Teko?preview.text_type=custom
  
  
  theme(
    
    #grid elements
    panel.border =  element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(color = "#d2d2d2"),
    panel.grid.minor.y = element_blank(),
    axis.ticks = element_blank(),          # strip axis ticks
    
    # since theme_minimal() already strips axis lines, 
    # we don't need to do that again
    
    # text elements
    plot.title = element_text(             # title
      family = font,            # set font family
      size = 20,                # set font size
      face = 'bold',            # bold typeface
      color = "black",          # set font color
      hjust = 0,                # middle align*
      vjust = 2),               # raise slightly*
    
    # *The value of hjust and vjust are only 
    # defined between 0 and 1:
    # 0 means left-justified
    # 1 means right-justified
    # 0.5 means middle-justified
    
    plot.subtitle = element_text(          # subtitle
      family = font,                       # font family
      color="black",                     # set font color
      size = 12),                          # font size
    
    plot.caption = element_text(           # caption
      family = font,                       # font family
      size = 9,                            # font size
      face = "italic",                     # italic typeface
      colour = "#4c4c4c",                  # set font color
      hjust = 0),                          # left align
    
    axis.title = element_text(             # axis titles
      family = font,                       # font family
      face = 'bold',                       # bold typeface
      color = "#2e2e2e",                   # set font color
      size = 10),                          # font size
    
    axis.text = element_text(              # axis text
      family = font,                       # axis family
      color = "#2e2e2e",                   # set font color
      size = 9),                           # font size
    
    axis.text.x = element_text(            # margin for axis text
      color = "#2e2e2e",                   # set font color
      margin=margin(5, b = 10)),
    
    axis.text.y = element_text(            # margin for axis text
      color = "#2e2e2e",                   # set font color
      margin=margin(10, b = 20)),
    
    legend.position="bottom",              # set the legend position
    
    legend.title = element_blank(),        # set NULL legend tittle
    
    legend.text = element_text(
      colour="#2e2e2e",                    # set legend text color 
      family = font                        # font family
    ),
    
    plot.background = element_rect(
      fill = "#f7efd8", 
      colour = NA
      ),
    
    panel.background = element_rect(
      fill = "#f7efd8", 
      colour = NA
      )
    
    # since the legend often requires manual tweaking 
    # based on plot content, don't define it here
  )
}
