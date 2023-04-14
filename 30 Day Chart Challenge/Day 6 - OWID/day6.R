library(tidyverse)
library(ggplot2)
library(showtext)
library(ggtext)
library(ggrepel)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day6=read.csv('~/Desktop/30 Day Chart Challenge/Day 6 - OWID/life-expectancy-vs-gdp-per-capita.csv',na.strings = c('','NA'))

day6 = day6 %>% group_by(Code) %>% fill(Continent) %>% ungroup %>% filter(Year==2018,!is.na(Code),Entity!='World')

ggplot(day6, aes(x=log(GDP.per.capita),y=Life.expectancy.at.birth..historical.))+
  geom_point(aes(colour=Continent),size=3,alpha=0.8)+
  geom_text_repel(day6 %>% filter(Entity=='Malaysia'), mapping = aes(x = log(GDP.per.capita), label = Entity),
                  size = 4, fontface = "bold", nudge_x = 0.5)+
  labs(title='\nLife Expectancy at Birth vs. GDP per Capita',
       subtitle='People in higher income countries tend to live longer.\n',
       caption='Source: Our World in Data.')+
  scale_color_manual(values = c('Africa'='#355070',
                                'Asia' = '#73A6AD',
                                'Europe' = '#A33B20',
                                'North America' = '#D8A7CA',
                                'Oceania' = '#E98A15',
                                'South America' = '#E3E7AF'))+
  scale_x_continuous(breaks=c(log(1000),log(2000),log(5000),log(10000),log(20000),log(50000),log(100000)),
                     labels=c('$1,000','$2,000','$5,000','$10,000','$20,000','$50,000','$100,000'))+
  scale_y_continuous(breaks=c(55,60,65,70,75,80),labels=c('55 years','60 years','65 years','70 years','75 years',
                                                          '80 years'))+
  xlab('\nGDP per Capita')+
  ylab('Life Expectancy at Birth\n')+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face='bold',size=13),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.grid.minor = element_blank(),
        panel.grid.major=element_line(color='white'),
        panel.border = element_blank(),
        panel.background = element_rect(fill='#FDF8EC'),
        plot.background = element_rect(fill='#FDF8EC'),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key = element_blank(),
        plot.margin = margin(, 2, , 2,'cm'))
  
