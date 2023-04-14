library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)

day4 = read.csv('~/Desktop/30 Day Chart Challenge/Day 4 - Historical/day4.csv') %>% filter(Year>1960)

font_add_google('Montserrat','Montserrat')
showtext_auto()

ggplot(day4,aes(x=Year,y=0.5,fill=Temperature)) +
  geom_tile() +
  theme_bw() + 
  labs(title = '\nAverage Annual Temperature in Malaysia (1961-2021)\n',
       caption = '\nSource: Climate Research Unit, University of East Anglia.\n') +
  ylab("") +
  scale_x_continuous(expand = c(0,0),limits=c(1961,2021), 
                   breaks=c(1961,1971,1981,1991,2001,2011,2021)) +
  scale_y_continuous(expand = c(0,0)) +
  scale_fill_gradient(low = "#5296A5",
                      high = "#FCD7AD",
                      guide = "colorbar",
                      breaks = c(min(day4$Temperature),
                                 mean(day4$Temperature),
                                 max(day4$Temperature)),
                      labels = c(25.39,
                                 26.07,
                                 26.92)) +
  theme(legend.position = 'bottom',
        text=element_text(family='Montserrat',face='bold'),
        plot.caption = element_text(hjust=0,size=8),
        plot.title = element_text(size=15),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        plot.margin = margin(, 2, , 2,'cm'))
