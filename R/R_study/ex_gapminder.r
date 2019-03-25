# plotly : ggplot2와 연계 가능. 인터랙티브 시각화 패키지. 

# install.packages('tidyverse')
# install.packages('plotly')
# install.packages('gapminder')

library(tidyverse)
library(plotly)
library(gapminder)
packageVersion('plotly')

## `ggplot` 정적 그래프
hello_world_g <- gapminder %>% 
  filter(year == max(year)) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point() 

hello_world_g

## `plotyly` 인터랙티브 그래프
ggplotly(hello_world_g)


##############################
df <- data.frame(
  x = c(1,2,1), 
  y = c(1,2,1), 
  f = c(1,2,3)
)

p <- df %>%
  plot_ly(
    x = ~x, 
    y = ~y, 
    frame = ~f, 
    type = 'scatter',
    mode = 'markers',
    showlegend = F
  )

ggplotly(p)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link <- api_create(p, filename="animations-basic")
chart_link

##############################
gapminder$year
p <- gapminder %>%
  plot_ly(
    x = ~gdpPercap, 
    y = ~lifeExp, 
    size = ~pop, 
    color = ~continent, 
    frame = ~year, 
    text = ~country, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="animations-mulitple-trace")
chart_link




library(plotly)
p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
api_create(p, filename = "r-docs-midwest-boxplots")
