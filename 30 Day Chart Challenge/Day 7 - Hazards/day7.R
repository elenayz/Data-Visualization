library(tidyverse)
library(ggplot2)
library(ggalluvial)
library(ggtext)
library(showtext)
library(streamgraph)
library(ggstream)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day7=read.csv('~/Desktop/30 Day Chart Challenge/Day 7 - Hazards/disaster.csv')

ggplot(day7,aes(x=Year,y=Freq))+
  geom_line(aes(color=Disaster))+
  geom_point(aes(color=Disaster))+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face='bold'),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "bottom")

streamgraph(day7,Disaster,Freq,Year)

ggplot(day7, aes(x=Year,y=Freq,fill=Disaster))+
  geom_stream(type='ridge')+
  scale_x_discrete(expand = c(0,0))+
  scale_y_continuous(expand = c(0,0))+
  theme_bw()

ggplot(day7,aes(axis1=Year,axis2=Disaster,y=Freq))+
  scale_x_discrete(limits=c('Year','Disaster'))+
  geom_alluvium(aes(fill=Disaster),show.legend = FALSE)+
  geom_stratum(color='white')+geom_text(stat='stratum',infer.label=TRUE)+
  scale_fill_manual(values = c('CBRN'='#FFDBB5',
                               'Fire'='#E0A458',
                               'Flood'='#B5E2FA',
                               'Landslide'='#419D78',
                               'Storm'='#C04ABC'))+
  theme_void()

ggplot(day7,aes(x=Year,y=Freq,fill=Disaster))+
  geom_bar(position='stack',stat='identity',width=0.6)+
  scale_fill_manual(values = c('CBRN'='#03045E',
                               'Fire'='#0077B6',
                               'Flood'='#00B4D8',
                               'Landslide'='#90E0EF',
                               'Storm'='#CAF0F8'))+
  scale_x_continuous(breaks=c(2016,2017,2018,2019,2020,2021),labels=c('2016','2017','2018','2019','2020','2021'))+
  scale_y_continuous(expand=c(0,0))+
  labs(title='\nDisaster Events in Malaysia, 2016-2021\n',
       caption = '\nSource: National Disaster Management Agency (Malaysia).\nNote: CBRN - Chemical, biological, radiological and nuclear.')+
  xlab('\nYear')+
  ylab('Frequency\n')+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face='bold',size=15),
        plot.title=element_text(size=20),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        plot.background = element_rect(fill='#F6E2DF'),
        panel.background = element_rect(fill='#F6E2DF'),
        legend.position = "bottom",
        legend.title=element_blank(),
        legend.background = element_blank(),
        plot.margin = margin(, 2, , 2,'cm'))
