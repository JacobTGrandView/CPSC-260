#Create an object contsining numbers 1 through 6

#combine command: c()
#can use = or <- to create an object

Die <- c(1,2,3,4,5,6) #Can also do c(1:6) to say numbers one through 6


#The average values of numbers 1 through 6

mean(Die):
  
  
#The sum of numbers 1 through 6
sum(Die)



#Roll one die
sample(x-Die, size-1)


#Function to roll multiple die (num = number of die)
#returns sum of die

Die.roll <- function(num){
  Die <- c(1:6)
  Roll <- sample(x=Die, size=num, replace = TRUE)
  S <- sum(Roll)
  return(S)
}

Die.roll(num=2) #rolling 2 dice

install.packages("ggplot2")
library(ggplot2)



#create two vectors of the same length. Scattergraph

x<-c(1,3,8,19,6)
y<-c(1,9,2,3,4)

qplot(x, y)



#creating a histogram

x<-c(1,5,9,11,13)
qplot(x, binwidth = 3) #binwidth is the width of the bars in the graph



Die.roll()

rolls<- replicate(10000, Die.roll()) #replicate is replicating rolling the dice 10k times
rolls
qplot(rolls, binwidth=1) #graphing the rolls




help(sample) #Brings you to the help section on samples



weights<-c(1/8,1/8,1/8,1/8,1/8,3/8) #everything has a probability of 1/8 being rolled besides 6 with 3/8
weights


weighted.Die.roll <-function(num=2, W){
  Die <- c(1:6)
  Roll<-sample(x=Die,size=num,replace=TRUE, prob=W)
  S<-sum(Roll)
  return(S)
}

weighted.Die.roll(W=weights)

weighted.rolls <- replicate(10000, weighted.Die.roll(W=weights))
qplot(weighted.rolls, binwidth = 1)


















