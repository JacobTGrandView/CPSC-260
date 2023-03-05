### 2-8-2022 Homework 2 ###


#problem 1a

buff_tail<-c(10,1,37,5,12)
garden_bee<-c(8,3,19,6,4)
red_tail<-c(18,9,1,2,4)
honeybee<-c(12,13,16,9,10)
carder_bee<-c(8,27,6,32,23)

bees<-c("Buff Tail", buff_tail,"Garden bee", garden_bee,"Red tail", red_tail,"Honeybee", honeybee,"Carder bee", carder_bee)
bees


#problem 1b

bee.data<-c(buff_tail,garden_bee,red_tail,honeybee,carder_bee)
bee_matrix <- matrix(bee.data,nrow=5,ncol=5)
colnames(bee_matrix) <- c("Buff tail", "Garden bee", "Red tail", "Honeybee", "Carder bee")
bee_matrix


#problem 1c

bee_data_frame = data.frame(bee_matrix)
bee_data_frame


#problem 1d

write.table(bee_data_frame)


#problem 2a


bee_data_frame2 = data.frame(buff_tail, garden_bee, red_tail, honeybee, carder_bee)
bee_data_frame2


#problem 2b

bee_matrix2 = as.matrix(bee_data_frame2)

bee_matrix2
class(bee_matrix2)


#problem 2c

plants = c("Thistle", "Vipers_bugloss", "Golden_rain", "Yellow_alfalfa", "Blackberry")
plants

#problem 2d

row.names(bee_matrix2) = c(plants)
bee_matrix2


#problem 3a

row.names(bee_data_frame2) = plants
bee_data_frame2

bee_data_frame2["Blackberry", ]


#problem 3b

bee_data_frame2[3:4, ]


#problem 3c

bee_data_frame2[3, 1]


#problem 3d

bee_data_frame2[ , 3]

bee_data_frame2$red_tail


#problem 3e

bee_data_frame2[1:5, -3]


#problem 3f

bee_data_frame2[-4,4]


#problem 3g 	data for just the plants
#where at least 10 Honeybees and 
#Buff tails were observed

bee_data_frame2[-4, c("buff_tail", "honeybee")]
subset.data.frame(bee_data_frame2, buff_tail & honeybee > 9, select=c(buff_tail, honeybee))

bee_data_frame2

filter(bee_data_frame2, !buff_tail %in% c(1, 5))

filter(bee_data_frame2, !honeybee %in% c(9) & !buff_tail %in% c(1,5))

filter(bee_data_frame2, !honeybee %in% c(12,13,16,9) & !buff_tail %in% c(1,5))

help(filter)

filter(bee_data_frame2(between(buff_tail, 10, 37))) & honeybee(between(honeybee, 10,37))


#problem 4a

NewDeck<-read.csv(file=file.choose())


#problem 4b

newdeal=function(newcards){
  newcards[5,]
}

newrandom=sample(1:52, size = 52)
newrandom

NewDeck=deck[newrandom,]
head(NewDeck)

newshuffle=function(newcards){
  newrandom=sample(1:52, size=52)
  newcards[newrandom,]
}

deal(NewDeck)
deck10=newshuffle(NewDeck)

deal(deck10)



newdeal <- function() {
  card <- deck[1:5, ]
  assign("deck", deck[-1 & -2 & -3 & -4 & -5 ], envir = globalenv())
  card
}

newdeal()
DECK=deck

newshuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}

x = newshuffle(newdeal)

head(NewDeck, 3)
head(x, 3)      


newshuffle()
newdeal()


#problem 4c



shuffle5c = shuffle(deck){
  shuffle = sample(1:52, size = 52)
  deck[shuffle, ]
}

shuffle5d = shuffle5c(deck)

deal5<-function(){
  shuffle5d = shuffle5d[c(1), ]
  head(shuffle5d, n=5)
}

p1 = deal5()
p2 = deal5()
p3 = deal5()






