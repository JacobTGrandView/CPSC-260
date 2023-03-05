library(babynames)
library(tidyverse)
help(lifetables)
head(babynames)
head(lifetables)


bb.temp=babynames %>% filter(year %in% 1900:2014)%>%
  mutate(count_thousands=n/1000, x=2014-year)

bb.temp


join = full_join(bb.temp, lifetables, by=c('x', 'year', 'sex'))
join

bb.names = join %>% mutate(alive_prob = lx/100000, age_today=x)%>%
  select(-x, -qx, -lx, -dx, -Lx, -Tx, -ex)

bb.names


Joseph = bb.names%>%filter(name=='Joseph' & sex=='M')
print(Joseph, n=25)


library(zoo)
Joseph = Joseph %>% mutate(alive_prob=na.approx(alive_prob, rule=2),
                           est_alive_today = count_thousands * alive_prob)

View(Joseph)



Baby = read.csv(file=file.choose())
View(Baby)

Joseph = Baby%>%filter(name=="Joseph" & sex=="M")
head(Joseph)


#Blue bars - use geom_col()

colnames(babynames)

ggplot(data=Joseph)+
  geom_col(mapping = aes(x=year, y=n), color = 'lightblue')+
  labs(x=NULL, y=NULL)


#Dark blue line

d = rep(Joseph$age_today, Joseph$est_alive_today_thousands)
median(d)
2014-39

#1975
J.75=Joseph %>% filter(year==1975)


ggplot(data=Joseph, mapping=aes(x=year))+
  geom_col(mapping=aes(y=est_alive_today_thousands), 
           fill='lightskyblue', color='white')+
  labs(x=NULL, y=NULL,
       title = 'Age Distribution of American Boys Named Joseph',
       subtitle="By year of birth")+
  geom_col(data=J.75, mapping=aes(y=est_alive_today_thousands),
           fill='dodgerblue', color='white')+
  geom_line(mapping=aes(y=count_thousands), lwd=1)+
  geom_text(data=text, mapping=aes(x=x.coord, y=y.coord, label=Text, color=text))+
  ylim(0,40)+
  geom_curve(x = 1995, xend = 1975, y = 32, yend = 24, arrow = arrow(length = unit(1, 'cm')), curvature = .5)

    
#Add text to graph
  
text = c('Number of Josephs born each year estimated to be alive on Jan 1, 2014', 'Number of Josephs born each year', 'The median living Joseph is 37 years old')
x.coord=c(1950, 2000, 1930)
y.coord = c(30, 10, 15)  
data.frame(text, x.coord, y.coord)  




#Graph for the name Casey

Casey = Baby%>%filter(name=="Casey")
head(Casey)

ggplot(data = Casey, mapping=aes(x=year))+
  geom_col(mapping=aes(y=est_alive_today_thousands),
           fill='lightskyblue', color='white')+
  labs(x=NULL, y=NULL,
       title="Age Distribution of Americans Named Casey",
       subtitle = 'By year of birth')+
  geom_line(mapping=aes(y=count_thousands), lwd = 1)+
  facet_wrap(~sex)



#Comparing male name Joseph vs female name Josephine

Josephine = Baby%>%filter(name=="Josephine", name == 'Joseph')

ggplot(data = Josephine, mapping=aes(x=year))+
  geom_col(mapping=aes(y=est_alive_today_thousands),
           fill='lightskyblue', color='white')+
  labs(x=NULL, y=NULL,
       title="Age Distribution of Americans Named Joseph & Josephine",
       subtitle = 'By year of birth')+
  geom_line(mapping=aes(y=count_thousands))+
  facet_wrap(~name)



#Making a graph for the name Jacob

Jacob = Baby%>%filter(name=="Jacob")
head(Jacob)

ggplot(data = Jacob, mapping=aes(x=year))+
  geom_col(mapping=aes(y=est_alive_today_thousands),
           fill='lightskyblue', color='white')+
  labs(x=NULL, y=NULL,
       title="Age Distribution of Americans Named Jacob",
       subtitle = 'By year of birth')+
  geom_line(mapping=aes(y=count_thousands), lwd = 1)+
  facet_wrap(~sex)






  
  
