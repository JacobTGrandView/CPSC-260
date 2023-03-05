library(Lahman)
library(dplyr)
library(nycflights13)

help(Lahman)
help(Batting)
help(Master)

BA = select(Batting, H / AB) #hits divided by at bats
HomeRuns270 = filter(Batting, BA < .24, HR >= 270)
HomeRuns270

HomeRuns270. = select(HomeRuns270, BA, HR, nameFirst, nameLast)
AddNames = HomeRuns270 %>% left_join(Master, by='nameFirst')



Batting
Master
BA



head(flights)
head(airlines)
help(flights)

flights %>%
  filter(dest == 'ORD') %>%
  mutate(AvgGainTime = mean(dep_delay - arr_delay)) %>%
  arrange(AvgGainTime, na.rm = T) %>%
  group_by(carrier)


BestCarrier = select(flights, AvgGainTime, carrier)
filter(flights, carrier %in% c("9E", "AA", "AS", 'B6', 'DL', 'EV'))

select(flights, AvgGainTime, carrier)

BestCarrier = flights %>% left_join(airlines, by='AvgGainTime')





















