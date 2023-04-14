library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day8 = read.csv('~/Desktop/30 Day Chart Challenge/Day 8 - Humans/population_data.csv')

day8 %>% mutate(population = ifelse(gender=='male', population*(-1),population*1))%>%
  ggplot(aes(x = lower_age,y = population)) +
  geom_bar(stat = "identity",aes(fill=gender)) +
  coord_flip()+
  scale_fill_manual(values = c('female'='#EAC7C7',
                               'male'='#A0C3D2'),labels=c('Female','Male'))+
  facet_wrap(~ year, ncol = 3, strip.position = 'top')+
  labs(title='\nMalaysia\'s Population Pyramid\n',
       subtitle='Ageing Malaysia? The transition into an ageing country can be seen when comparing Malaysia\'s \npopulation pyramids across different decades.\n',
       caption = '\nSource: Dept. of Statistics Malaysia (2000-2020), World Population Prospects (2030-2050).\n')+
  theme_void()+
  theme(text = element_text(family = "Montserrat",face='bold',size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=13,face = 'plain'),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.title=element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "bottom",
        legend.title=element_blank(),
        legend.text = element_text(size=8),
        strip.text = element_text(size=12),
        plot.margin = margin(, 2.5, , 2.5,'cm'))
