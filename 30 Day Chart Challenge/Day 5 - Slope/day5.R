library(tidyverse)
library(ggplot)
library(ggrepel)
library(ggtext)
library(showtext)

'%notin%' = Negate('%in%')

day5 = read.csv('~/Desktop/30 Day Chart Challenge/Day 5 - Slope/day5.csv') %>% filter(Category %notin% 
                                                                                        c('Older adults','Young adults'))



font_add_google('Montserrat','Montserrat')
showtext_auto()

day5_long=gather(day5, Year, Percentage, X2017:X2021, factor_key=TRUE) %>% 
  mutate(Year = recode(Year, X2017 = 2017,
                         X2021 = 2021))

ggplot(day5_long,aes(x=Year, y=Percentage,group=Category))+
  geom_line(aes(color=Category),size=1,alpha=0.8)+
  geom_point(aes(color=Category),size=3,alpha=0.8)+
  labs(title='\nAdults who made or received digital payments (Malaysia)',
       subtitle='Over the past few years, the number of adults who made or received digital payments have \nincreased across different demographic backgrounds. However, women, the poor and less \neducated are still lagging behind.\n',
       caption='\nSource: The Global Findex Database (World Bank)\n')+
  ylab('')+
  xlab('')+
  geom_vline(xintercept=2017,color='#D8D8D8')+
  geom_vline(xintercept=2021,color='#D8D8D8')+
  scale_y_continuous(limits=c(50,85), breaks = c(50,55,60,65,70,75,80,85),
                     labels=c('50%','55%','60%','65%','70%','75%','80%','85%'))+
  scale_x_continuous(expand=c(0,0),breaks=c(2017,2021),position='top')+
  geom_text_repel(data = day5_long %>% filter(Year == 2021), mapping = aes(y = Percentage, label = Category,color=Category),
                  size = 4, fontface = "bold", nudge_x = 0.9) +
  theme_minimal()+
  theme(text = element_text(family = "Montserrat",face='bold',size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(size=10,face = 'plain'),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "none")+
  coord_cartesian(clip='off',
                  xlim=c(min(day5_long$Year),max(day5_long$Year) + 2))

                  