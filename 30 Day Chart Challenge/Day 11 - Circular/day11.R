library(tidyverse)
library(ggplot2)
library(stringr)
library(ggtext)
library(showtext)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day11=read.csv('~/Desktop/30 Day Chart Challenge/Day 11 - Circular/tfr_malaysia.csv')

label_data = day11
number_of_bar=nrow(label_data)
angle <-  90 - 360 * (label_data$id-0.5) /number_of_bar
label_data$id=seq(1,number_of_bar)
label_data$hjust=ifelse( angle < -90, 1, 0)
label_data$angle=ifelse(angle < -90, angle+180, angle)
label_data$labels=paste(label_data$Year,label_data$TFR, sep=': ')


ggplot(day11,aes(x=Year,y=TFR))+
  geom_bar(stat='identity',fill=alpha('#AC7088',0.7))+
  labs(title='\nTotal Fertility Rate in Malaysia (1960-2020)\n',
       caption='Source: The World Bank\n')+
  theme_minimal() +
  ylim(-3,7)+
  theme(text = element_text(family = "Montserrat",face='bold',size=14,color='#506D84'),
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    panel.background = element_rect(fill='#F5E8C7',color='#F5E8C7'),
    plot.background = element_rect(fill='#F5E8C7',color='#F5E8C7'),
    plot.margin = margin(,0.5,,0.5,'cm'),
    plot.caption = element_text(hjust=0,size=8)) +
  coord_polar()+
  geom_text(data=label_data, aes(x=Year, y=TFR+0.5, label=labels, hjust=hjust), color="#506D84", fontface="bold", size=2.5, angle= label_data$angle, inherit.aes = FALSE )
