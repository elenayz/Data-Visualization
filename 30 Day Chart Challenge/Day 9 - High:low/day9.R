library(tidyverse)
library(ggplot)
library(scales)
library(showtext)
library(ggtext)

font_add_google('Montserrat','Montserrat')
showtext_auto()

day9 = read.csv('~/Desktop/30 Day Chart Challenge/Day 9 - High:low/2020_MY_Region_Mobility_Report.csv') %>% 
  filter(sub_region_1=='') %>% select(date, retail_and_recreation_percent_change_from_baseline,grocery_and_pharmacy_percent_change_from_baseline,
                                      parks_percent_change_from_baseline, transit_stations_percent_change_from_baseline, workplaces_percent_change_from_baseline)

day9_long = gather(day9, places, baseline_change, retail_and_recreation_percent_change_from_baseline:workplaces_percent_change_from_baseline,factor_key = TRUE) %>% 
  mutate(places=recode(places,retail_and_recreation_percent_change_from_baseline='Retail and Recreation',
                       grocery_and_pharmacy_percent_change_from_baseline='Grocery and Pharmacy',
                       parks_percent_change_from_baseline = 'Parks', 
                       transit_stations_percent_change_from_baseline = 'Transit Stations',
                       workplaces_percent_change_from_baseline = 'Workplaces'))


day9_long$date =as.Date(day9_long$date,"%Y-%m-%d")

ggplot(day9_long,aes(x=date,y=baseline_change,color=places))+
  geom_line(aes(group=places),size=0.8)+
  labs(title = '\nChanges in Community Mobility in 2020 (Malaysia)',
       subtitle = 'In 2020, Malaysia implemented a series of quarantine orders (Movement Control Order) in response to the COVID-19 pandemic.\nThe first one started from 18th March 2020, where we can see a significant drop in community mobility compared to the baseline.\nThis continued until 4th May 2020, when the Government announced the CMCO and eased the lockdown restrictions and we start \nto see a slow increase in the community mobility compared to during the MCO.\n',
       caption = 'Source: Google, COVID-19 Community Mobility Report.\nNote: MCO - Movement Control Order, CMCO - Conditional Movement Control Order, RMCO - Recovery Movement Control Order.\nBaseline: 2020-01-03 to 2020-02-06.\n')+
  xlab('')+
  ylab('% Change from Baseline')+
  geom_vline(xintercept = as.Date('2020-03-18'),linetype=4)+
  geom_vline(xintercept = as.Date('2020-05-03'),linetype=4)+
  geom_vline(xintercept = as.Date('2020-06-09'),linetype=4)+
  annotate(geom="text", x=as.Date('2020-04-10'), y=54, label="MCO")+
  annotate(geom="text", x=as.Date('2020-05-22'), y=54, label="CMCO")+
  annotate(geom="text", x=as.Date('2020-10-01'), y=54, label="RMCO")+
  scale_x_date(breaks=date_breaks('1 month'))+
  scale_color_manual(values=c('Retail and Recreation'='#9F2042',
                              'Grocery and Pharmacy'='#247BA0',
                              'Parks'='#519872',
                              'Transit Stations'='#B5838D',
                              'Workplaces'='#9D9171'))+
  theme_bw()+
  theme(text = element_text(family = "Montserrat",face='bold',size=10),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.position = 'bottom',
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.background = element_rect(fill='white'),
        plot.background = element_rect(fill='white'),
        plot.title=element_text(size=15),
        plot.caption = element_text(hjust=0,size=8),
        plot.subtitle = element_text(face='plain'),
        panel.border = element_blank(),
        plot.margin = margin(, 2, , 2,'cm'))

        