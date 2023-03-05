### Data mining 3-29-2022 Homework 5 ###

install.packages('fueleconomy')
install.packages('maps')
library(tidyverse)
library(nycflights13)
library(Lahman)
library(babynames)
library(fueleconomy)
library(maps)

airlines #Carrier name and abbreviation
airports #Airport information
planes #Information about each plane
weather #Weather at each NYC airport for each hour


#13.2.1 problem 1

#Imagine you wanted to draw (approximately) the route each plane 
#flies from its origin to its destination. What variables 
#would you need? What tables would you need to combine?

#You would need the 'flights' and 'airports' tables. The 'flights' table
#has the origin and destination airport of each flight. The 'airports' table
#has the longitude and latitude of each airport.
#You would need to combine 'flights' and 'airports'


#13.2.1 problem 3

#'weather' only contains information for the origin (NYC) airports. 
#If it contained weather records for all airports in the USA, what
#additional relation would it define with 'flights'?

#If weather was included for all airports in the US, then it would provide
#the weather for the destination of each flight


#13.3.1 problem 2. Parts 1,2, & 4. 

#1) Identify the keys in the following datasets - Lahman::Batting

Lahman::Batting %>%
  count(playerID, yearID, stint) %>%
  filter(n > 1) %>%
  nrow()

#2) Identify the keys in the following datasets - babynames::babynames

babynames::babynames %>%
  count(year, sex, name) %>%
  filter(n > 1) %>%
  nrow()

#4) Identify the keys in the following datasets - fueleconomy::vehicles

fueleconomy::vehicles %>%
  count(id) %>%
  filter(n > 1) %>%
  nrow()


#Refer to #2 part 5 - Explain why there is no primary key and add a surrogate key

ggplot2::diamonds %>%
  distinct() %>%
  nrow()

Diamonds2 <- mutate(diamonds, id = row_number())
Diamonds2


#13.3.1 problem 3. Diagram showing the connections between 'Batting', 'People', & 'Salaries' in Lahman

help(Salaries)
help(Batting)
help(People)


#13.4.6 problem 1

airports %>%
  semi_join(flights, c('faa' = 'dest')) %>%
  ggplot(aes(lon, lat))+
    borders('state')+
    geom_point()+
    coord_quickmap()

avg_dest_delays =
  flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = T)) %>%
  inner_join(airports, by = c(dest = 'faa'))

avg_dest_delays %>%
  ggplot(aes(lon, lat, colour = delay))+
  borders('state')+
  geom_point()+
  coord_quickmap()


#13.4.6 problem 3

planes_flights_joined = inner_join(flights, select(planes, tailnum,
                                                   plane_year = year), #plane_year is the year plane was built
                                   by = 'tailnum') %>%
  mutate(age = year - plane_year) %>%
  filter(!is.na(age)) %>%
  group_by(age) %>%
  summarise(dep_delay_avg = mean(dep_delay, na.rm = T)) #NA values remove is True

ggplot(planes_flights_joined, aes(x=age, y = dep_delay_avg))+
  geom_point()+
  labs(x = 'Age of plane', y = 'Average departure delay')


#13.4.6 problem 4

flights_weather_delay = flights %>%
  inner_join(weather, by = c(
    'origin' = 'origin',
    'year' = 'year',
    'month' = 'month',
    'day' = 'day',
    'hour' = 'hour'))
    
flights_weather_delay %>%
    group_by(precip) %>%
    summarise(delay=mean(dep_delay, na.rm = T)) %>%
    ggplot(aes(x=precip, y = delay))+
    geom_point()














