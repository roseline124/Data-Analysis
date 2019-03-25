library(plotly)
library(tidyverse)

df = read.csv('https://raw.githubusercontent.com/bcdunbar/datasets/master/meteorites_subset.csv')

p <- df %>%
  plot_mapbox(lat = ~reclat, lon = ~reclong,
              split = ~class, size=2,
              mode = 'scattermapbox', hoverinfo='name') %>%
  layout(title = 'Meteorites by Class',
         font = list(color='white'),
         plot_bgcolor = '#191A1A', paper_bgcolor = '#191A1A',
         mapbox = list(style = 'dark'),
         legend = list(orientation = 'h',
                       font = list(size = 8)),
         margin = list(l = 25, r = 25,
                       b = 25, t = 25,
                       pad = 2))


ggplotly(p)
