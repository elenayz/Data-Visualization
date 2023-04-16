library(tidyverse)
library(ggplot2)
library(bbplot)

day12=read.csv('~/Desktop/30 Day Chart Challenge/Day 12 - BBC/d9f0b790-4168-45d7-abef-2d4983b84640_Data.csv')

day12$age_group <- factor(day12$Series.Code, levels=c("65+","15-64","0-14"))

day_12 = ggplot(day12,aes(x=Year,y=Percentage,fill=age_group))+
  geom_area()+
  scale_fill_manual(values=c('0-14'='#991402',
                             '15-64'='#1380a2',
                             '65+'='#faab1f'))+
  guides(fill=guide_legend(reverse=TRUE))+
  scale_y_continuous(labels=c('0%','25%','50%','75%','100%'))+
  bbc_style()+
  labs(title = 'Population in Malaysia by Age Group')+
  theme(legend.justification = 'left')

finalise_plot(plot_name = day_12,
              source = "Source: The World Bank",
              save_filepath = "day12.png",
              width_pixels = 640,
              height_pixels = 450)
