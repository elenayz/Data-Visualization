library(ggplot2)
library(waffle)
library(dplyr)
library(hrbrthemes)
library(tidyverse)
library(ggtext)
library(showtext)

day2 = read_csv('~/Desktop/30 Day Chart Challenge/Day 2 - Waffle/state_population.csv')

font_add_google('Montserrat','Montserrat')
showtext_auto()

day2_long=gather(day2, age_group, proportion, Children:Elderly, factor_key=TRUE)

ggplot(day2_long, aes(fill=age_group,values=proportion)) +
  labs(title='\nPopulation Age Group in Malaysia by States\n',
       subtitle='Perak has the highest proportion of the elderly, while the proportion of the working age group is highest \nin Kuala Lumpur.\n',
       caption='\nSource: Dept. of Statistics Malaysia, MyCensus 2020.') +
  facet_wrap(~ State, ncol = 4, strip.position = 'top') +
  geom_waffle(n_rows=10, size = 0.33, color='white') +
  coord_equal() +
  scale_fill_manual(values=c('Children'='#57C5B6', 
                             'Working'='#159895',
                             'Elderly' = '#1A5F7A'))+
  theme_void() +
  theme(legend.position = 'bottom',
        text=element_text(family='Montserrat', face='bold', color = '#002B5B'),
        plot.title = element_text(size=12, face='bold'),
        plot.subtitle = element_text(size=10,face = 'plain'),
        plot.caption = element_text(hjust=0,size=8),
        legend.title = element_blank(),
        legend.text = element_text(size=7),
        strip.text = element_text(size=8))
  