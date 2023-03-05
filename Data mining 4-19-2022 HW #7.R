### 4-19-2022 Homework 7 ###

library(tidyverse)

crime_prison = read.csv(file=file.choose())
crime_prison
view(crime_prison)


### Problem 1 - Only Midwest states for certain variables ###

crime_prison2 = filter(crime_prison, jurisdiction %in% c('IOWA', 'ILLINOIS', "NORTH DAKOTA", "SOUTH DAKOTA", "MINNESOTA", "WISCONSIN", "NEBRASKA", "KANSAS", "MISSOURI", "INDIANA", "MICHIGAN", "OHIO"))
crime_prison3 = crime_prison2 %>%
  select(1, 3, 4, 6, 7, 8, 9, 12, 13, 14, 17) #only selecting certain columns

crime_prison3



### Problem 2 - Prisoner_count over the years ###

crime_problem2 = crime_prison2 %>%
  select(jurisdiction, year, prisoner_count)

crime_problem2

#making wide data
crime_problem2_spread = spread(crime_problem2, key = 'year', value = 'prisoner_count')
view(crime_problem2_spread)

#making long data - 
crime_problem2_long = gather(crime_problem2, year, prisoner_count)
view(crime_problem2_long)



### Problem 3 ###

prisoner_count1 = crime_prison$prisoner_count
hist(prisoner_count1)

state_population1 = crime_prison$state_population
hist(state_population1)

violent_crime_total1 = crime_prison$violent_crime_total
hist(violent_crime_total1)

murder_manslaughter1 = crime_prison$murder_manslaughter
hist(murder_manslaughter1)

rape_legacy1 = crime_prison$rape_legacy
hist(rape_legacy1)

robbery1 = crime_prison$robbery
hist(robbery1)

agg_assault1 = crime_prison$agg_assault
hist(agg_assault1)

property_crime_total1 = crime_prison$property_crime_total
hist(property_crime_total1)

burglary1 = crime_prison$burglary
hist(burglary1)

larceny1 = crime_prison$larceny
hist(larceny1)

vehicle_theft1 = crime_prison$vehicle_theft
hist(vehicle_theft1)



### Problem 4 ### 

ggplot(crime_prison, mapping=aes(x=year, y= murder_manslaughter, color=jurisdiction))+
  geom_point()+
  geom_line()



### Problem 5 ###

ggplot(crime_prison, mapping=aes(x=year, y= prisoner_count, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= state_population, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= violent_crime_total, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= rape_legacy, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= robbery, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= agg_assault, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= property_crime_total, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= burglary, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= larceny, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= vehicle_theft, color=jurisdiction))+
  geom_point()+
  geom_line()



### Problem 6a ###

crime_problem6a = crime_prison %>%
  select(jurisdiction, year, murder_manslaughter)

crime_problem6a_spread = spread(crime_problem6a, key = 'year', value = 'murder_manslaughter')
view(crime_problem6a_spread)

crime_problem6a_spread[50,9] = 165
view(crime_problem6a_spread)



### Problem 6b ### 

crime_problem6b = crime_prison %>%
  select(jurisdiction, year, vehicle_theft)

crime_problem6b_spread = spread(crime_problem6b, key = 'year', value = 'vehicle_theft')
view(crime_problem6b_spread)

crime_problem6b_spread[50,9] = 11023
view(crime_problem6b_spread)



### Problem 6c ### 

crime_problem6c = crime_prison %>%
  select(jurisdiction, year, robbery)

crime_problem6c_spread = spread(crime_problem6c, key = 'year', value = 'robbery')
view(crime_problem6c_spread)

crime_problem6c_spread[33,16] = 30828
view(crime_problem6c_spread)



### Problem 6d ###

crime_problem6d = crime_prison %>%
  select(jurisdiction, year, state_population)

crime_problem6d_spread = spread(crime_problem6d, key = 'year', value = 'state_population')
view(crime_problem6d_spread)

crime_problem6d_spread[33,16] = 19795792
view(crime_problem6d_spread)



### Problem 6e ###

crime_problem6e = crime_prison %>%
  select(jurisdiction, year, property_crime_total)

crime_problem6e_spread = spread(crime_problem6e, key = 'year', value = 'property_crime_total')
view(crime_problem6e_spread)

crime_problem6e_spread[28,2] = 61512
crime_problem6e_spread[28,3] = 61512
crime_problem6e_spread[28,4] = 61512

view(crime_problem6e_spread)



### Problem 7 ###

ggplot(crime_prison, mapping=aes(x=prisoner_count, y= vehicle_theft, color=jurisdiction))+
  geom_point()



### Problem 8 ###

ggplot(crime_prison, mapping=aes(x=prisoner_count, y= vehicle_theft, color=year))+
  geom_point()

ggplot(crime_prison, mapping=aes(x=prisoner_count, y= vehicle_theft, color=as.factor(year)))+
  geom_point()

ggplot(crime_prison, mapping=aes(x=prisoner_count, y= vehicle_theft, color = jurisdiction))+
  geom_point()



### Problem 9 ###

# We still need to check the crimes_estimated variable. 
# Create a table for this categorical variable using table(). 
# What do you see? Describe any possible errors that you find. 

table(crime_prison$crimes_estimated)
view(crime_prison$crimes_estimated)


### Problem 10a ###

crimes_est_fix = crime_prison$crimes_estimated
crimes_est_fix[crimes_est_fix == 0] = FALSE
crimes_est_fix[crimes_est_fix == 1] = TRUE
crimes_est_fix
table(crimes_est_fix)
view(crimes_est_fix)


### Problem 10b ###

crime_problem10_wide[9,2] = FALSE
crime_problem10_wide[9,3] = FALSE
crime_problem10_wide[9,4] = FALSE
crime_problem10_wide[9,5] = FALSE
crime_problem10_wide[9,6] = FALSE
crime_problem10_wide[9,7] = FALSE
crime_problem10_wide[9,8] = FALSE
crime_problem10_wide[9,9] = FALSE
crime_problem10_wide[9,10] = FALSE
crime_problem10_wide[9,11] = FALSE
crime_problem10_wide[9,12] = FALSE
crime_problem10_wide[9,13] = FALSE
crime_problem10_wide[9,14] = FALSE
crime_problem10_wide[9,15] = FALSE
crime_problem10_wide[9,16] = FALSE
crime_problem10_wide[9,17] = FALSE

crime_problem10_wide[36,17] = FALSE
crime_problem10_wide[33,16] = FALSE
view(crime_problem10_wide)


### Problem 10c ###

crime_problem10 = crime_prison %>%
  select(jurisdiction, year, crimes_estimated)

crime_problem10

crime_problem10_wide = spread(crime_problem10, key = 'year', value = 'crimes_estimated')
view(crime_problem10_wide)



### Problem 11 ### 

Violent_crime_per_100k = (crime_prison$violent_crime_total / crime_prison$state_population) * 100000
Property_crime_per_100k = (crime_prison$property_crime_total / crime_prison$state_population) * 100000

crime_prison %>%
  mutate(Violent_crime_per_100k)

crime_prison %>%
  mutate(Property_crime_per_100k)



### Problem 12 ###

ggplot(crime_prison, mapping=aes(x=Property_crime_per_100k, y= Violent_crime_per_100k, color=as.factor(year)))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= Violent_crime_per_100k, color=jurisdiction))+
  geom_point()+
  geom_line()

ggplot(crime_prison, mapping=aes(x=year, y= Property_crime_per_100k, color=jurisdiction))+
  geom_point()+
  geom_line()



### Problem 13 ###

prisoner_count_max = max(crime_prison$prisoner_count)
prisoner_count_min = min(crime_prison$prisoner_count)
prisoner_count_range = prisoner_count_max - prisoner_count_min

pris_count_min_max_norm = (crime_prison$prisoner_count - prisoner_count_min) / prisoner_count_range

crime_prison %>%
  mutate(pris_count_min_max_norm)

hist(pris_count_min_max_norm)





