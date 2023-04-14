library(tidyverse)
library(ggplot2)
library(ggtext)
library(showtext)

data=read_csv('~/Desktop/30 Day Chart Challenge/Day 1 - Part to Whole/Full dataset - Master file 30092021.csv')

font_add_google('Montserrat','Montserrat')
showtext_auto()

day1=data %>% filter(ISO %in% c('BRN','IDN','KHM','LAO','MMR','MYS','PHL','SGP',
                               'THA','VNM')) %>% select(-Note,-ISO) %>% group_by(Country) %>% 
  summarise(fully_open = sum(Status=='Fully open')/640*100,
              closed = sum(Status=='Closed due to COVID-19')/640*100,
              partial = sum(Status=='Partially open')/640*100,
              abreak = sum(Status=='Academic break')/640*100)

day1_long=gather(day1, status, proportion, fully_open:abreak, factor_key=TRUE) %>% 
  mutate(status = recode(status, fully_open = 'Fully open',
                closed = 'Closed due to COVID-19',
                partial = 'Partially open',
                abreak = 'Academic break'))

ggplot(day1_long, aes(fill=status,y=proportion, x=Country)) +
  geom_bar(position=position_fill(reverse=TRUE),stat='identity', lwd=1.0, width=0.7, color='white') +
  coord_flip() + 
  scale_y_continuous(expand=c(0,0), labels = c('0%','25%','50%','75%','100%')) +
  labs(title='\nSchool Closures in ASEAN Countries during the COVID-19 Pandemic\n',
       subtitle='Between 16th February 2020 to 31st October 2021, schools in Singapore and Brunei remained fully open \nfor most of the time, while schools in the Philippines and Myanmmar were mostly closed.',
       caption='\nSource: UNESCO, data from 16th February 2020 to 31st October 2021.')+
  theme_bw()+
  scale_fill_manual(values=c('Fully open'='#E1EFF6', 
                             'Closed due to COVID-19'='#97D2FB',
                             'Partially open' = '#83BCFF',
                             'Academic break'='#80FFE8'))+
  theme(legend.position = 'bottom',
        text=element_text(family='Montserrat',face='bold'),
        plot.title = element_text(size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        legend.background = element_blank(),
        legend.title=element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.line = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        plot.margin = margin(, 2, , 2,'cm'))
   


#ECCBD9

  