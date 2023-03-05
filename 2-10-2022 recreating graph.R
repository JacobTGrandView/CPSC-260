library(tidyverse)
library(ggrepel)

econ<-read.csv(file=file.choose())


#create basic scatterplot:
ggplot(data-econ, mapping=aes(x=CPI, y=HDI))+
  geom_point()


ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point(mapping=aes(color=Region), size=3)+
  geom_smooth(se=FALSE, color='red', method='lm')


colors<-c("#24576D", "#099DD7", "#28AADC", "#248E84",
          "#F2583F", "#96503F")

pointsToLabel<-c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                 "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                 "India", "Italy", "China", "South Africa", "Spain",
                 "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                 "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                 "New Zealand", "Singapore")


ii=econ$Country %in% pointsToLabel
econ.subset<-econ[ii,]
econ.subset


ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point(mapping=aes(color=Region), size=3, shape = 1, stroke=1.25)+
  geom_smooth(se=FALSE, color='red', method='lm')+
  labs(x="Corruption Perception Index, 2011 (10 = least corrupt)",
       y="Human Development Index, 2011 (1=best)")+
  scale_color_manual(values=colors)+
  geom_text_repel(data=econ.subset , mapping=aes(label=Country))


econ2<-econ
econ2$Region <- factor(econ2$Region,
                      levels = c("EU W. Europe",
                                 "Americas",
                                 "Asia Pacific",
                                 "East EU Cemt Asia",
                                 "MENA",
                                 "SSA"),
                      labels = c("OECD",
                                 "Americas",
                                 "Asia &\nOceania",
                                 "Central &\nEastern Europe",
                                 "Middle East &\nnorth Africa",
                                 "Sub-Saharan\nAfrica"))


str(econ2)

#change data = econ to data = econ2
#assigning the graph to the object "p"
p<- ggplot(data=econ2, mapping=aes(x=CPI, y=HDI))+
      geom_point(mapping=aes(color=Region), size=3, shape = 1, stroke=1.25)+
      geom_smooth(se=FALSE, color='red', method='lm', formula=y~x + log(x))+
        labs(x="Corruption Perception Index, 2011 (10 = least corrupt)",
            y="Human Development Index, 2011 (1=best)")+
        scale_color_manual(values=colors)+
        geom_text_repel(data=econ.subset , mapping=aes(label=Country))


p+ scale_x_continuous(limits=c(1,10), breaks =1:10)+
   scale_y_continuous(limits=c(0.2,1), breaks=seq(.2,1, by=.1))+
   ggtitle("Corruption and human development")+
   theme_minimal()+
   theme(legend.position = 'top', 
         legend.text = element_text(size=11, color='gray20'),
         axis.text = element_text(color = 'gray40'),
         axis.title.x = element_text(size=8, color='gray40', face='italic'),
         axis.title.y = element_text(size=8, color='gray40', face='italic'),
         axis.line.x = element_line(color='gray40', size=.5),
         panel.grid.major.y = element_line(color='gray40', size = .5),
         panel.grid.major.x = element_blank() )+
   guides(color=guide_legend(nrow=1))










