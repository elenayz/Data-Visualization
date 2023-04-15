library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day10=read.csv('~/Desktop/30 Day Chart Challenge/Day 10 - Hybrid/unemployment.csv')

ggplot()+
  geom_bar(data=day10 %>% filter(group!='total'),aes(x=year,y=rate,fill=group),alpha=0.8,stat='identity',position=position_dodge())+
  geom_line(data=day10 %>% filter(group=='total'),aes(x=year,y=rate),color='#8B7E74',size=1.5)+
  geom_point(data=day10 %>% filter(group=='total'),aes(x=year,y=rate),color='#8B7E74')+
  labs(title='\nTotal Unemployment Rate in Malaysia',
       subtitle='\nThe line represents the total unemployment rate (UR), and the bars are UR by gender.\n',
       caption='\nSource: International Labor Office.\n')+
  xlab('')+
  ylab('Unemployment rate (%)\n')+
  scale_y_continuous(expand = c(0,0))+
  scale_fill_manual(values = c('female'='#EA5455',
                               'male'='#002B5B'),labels=c('Female','Male'))+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face='bold',size=10),
        plot.title=element_text(size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        plot.background = element_rect(fill='#F9F5EB'),
        panel.background = element_rect(fill='#F9F5EB'),
        legend.position = "bottom",
        legend.title=element_blank(),
        legend.background = element_blank(),
        plot.margin = margin(, 2, , 2,'cm'))
