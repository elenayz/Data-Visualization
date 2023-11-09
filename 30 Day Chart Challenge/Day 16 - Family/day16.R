library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day16=read.csv('~/Desktop/30 Day Chart Challenge/Day 16 - Family/day16.csv')

day16_long=gather(day16, year, avg_hh, avg_hh_20:avg_hh_10, factor_key = TRUE) %>% 
  mutate(year=recode(year, avg_hh_20=2020,
                     avg_hh_10=2010)) %>% mutate(year=factor(year))

day16_long$place=factor(day16_long$place,levels=c('Johor','Kedah','Kelantan','Melaka',
                                                  'Negeri Sembilan','Pahang','Pulau Pinang',
                                                  'Perlis','Perak','Selangor','Terengganu',
                                                  'Sabah','Sarawak','Kuala Lumpur','Labuan',
                                                  'Putrajaya','Malaysia'))


ggplot(day16_long,aes(x=avg_hh,y=place))+
  geom_line(linewidth=1,color='#B7B7B7')+
  geom_point(aes(color=year),size=3,alpha=0.8)+
  scale_color_manual(values=c('2010'='#D14D72','2020'='#3A98B9'))+
  labs(title='\nAverage Household Size in Malaysia\n',
       subtitle='Households in Malaysian states became smaller over the last decade except in Putrajaya (grew) and Kelantan (maintained).\n',
       caption='\nSource: Dept. of Statistics Malaysia\n')+
  ylab('')+
  xlab('\nAverage Household Size')+
  theme_bw()+
  theme(text=element_text(family='Montserrat',face='bold'),
        legend.position = 'bottom',
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.border = element_blank(),
        plot.background = element_rect(fill='#F9F5E7'),
        panel.background = element_rect(fill='#F9F5E7'),
        plot.title = element_text(size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'))
