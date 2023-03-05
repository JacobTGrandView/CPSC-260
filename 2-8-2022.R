library(tidyverse)

#Bring in data set
econ<-read.csv(file=file.choose())

head(econ)
tail(econ)
str(econ)

ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point()


#Color all points to a single color 
#Map color to region 
#map size to HDI.rank 
#make all points size 3 
#Overlay a smooth line on top of scatterplot
#remove the confidence interval (grey band)
#Make line red


ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point(mapping=aes(color=Region, size = HDI.Rank))
  geom_smooth(mapping = aes(x=CPI, y=HDI), color="red")
  
ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point(mapping=aes(color=Region), size = 3)+
  geom_smooth(se=F, color="red", method="lm")+
  
#se stands for standard error. how much your estimate might be off by
#lm = linear model
      
ggplot(data=econ, mapping=aes(x=CPI, y=HDI))+
  geom_point(mapping=aes(color=Region), size=3, shape = 1, stroke=1.25)+
  geom_smooth(se=FALSE, color='red', method='lm')+
  labs(x="Corruption Perception Index, 2011 (10 = least corrupt)",
       y="Human Development Index, 2011 (1=best)")+
  scale_color_manual(values=colors)+
  geom_text_repel(data=econ.subset , mapping=aes(label=Country))

#label points with country name
#create new data set that contains info for only the countries 
#that need to be labeled. [Specified in pointsToLabel vector]
ii=econ$Country %in% pointsToLabel
econ.subset<-econ[ii,]
econ.subset
  
#install new package: ggrepel
install.packages("ggrepel")
library(ggrepel)


#replace geom_text with geom_text_repel

  
colors<-c("#24576D", "#099DD7", "#28AADC", "#248E84",
          "#F2583F", "#96503F")

pointsToLabel<-c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
             "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
             "India", "Italy", "China", "South Africa", "Spain",
             "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
             "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
             "New Zealand", "Singapore")







      