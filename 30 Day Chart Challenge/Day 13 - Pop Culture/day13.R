library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)
library(ggrepel)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day13=read.csv('~/Desktop/30 Day Chart Challenge/Day 13 - Pop Culture/top_gross_movies.csv')

ggplot(day13,aes(x=Budget,y=Gross))+
  geom_point(aes(size=Rating),color='#B75D69',alpha=0.8)+
  xlab('\nBudget (USD Million)')+
  ylab('Gross (USD Billion)\n')+
  scale_x_continuous(breaks=c(0,100000000,200000000,300000000,400000000),labels=c(0,100,200,300,400))+
  scale_y_continuous(breaks=c(0,500000000,1000000000,1500000000,2000000000),labels = c('0','0.5','1.0','1.5','2.0'))+
  labs(title='\n2022 Worldwide Box Office Movies\n',
       caption='\nSource: IMDB\n',
       size='IMDB Rating')+
  geom_text_repel(day13, mapping = aes(y = Gross, label = Movie),
                  size = 3, nudge_x = 0.9)+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face = 'bold',size=10,color='#006D77'),
        plot.title=element_text(size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_rect(fill='#FFF3E2'),
        plot.background = element_rect(fill='#FFF3E2'),
        legend.position = "bottom",
        legend.title = element_text(size='8'),
        legend.key = element_blank(),
        legend.background = element_blank(),
        plot.margin = margin(, 1, , 1,'cm'))+
  coord_cartesian(clip='off')
