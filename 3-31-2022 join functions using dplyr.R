### Merging data frames using dplyr ###

library(dplyr)

#######################################

df1 = data.frame(CustomerId = c(1:6), product = c('Oven', 'Television', 'Mobile', 'WashingMachine', 'Lightings', 'Ipad'))
df1

df2 = data.frame(CustomerId = c(2,4,6,7,8), State = c('California', 'Newyork', 'Santiago', 'Texas', 'Indiana'))
df2


### inner_join() Returns the rows when matching condition is met ###

df = df1 %>% inner_join(df2, by='CustomerId')
df


### full_join() Returns all rows from both tables ###

df = df1 %>% full_join(df2, by='CustomerId')
df


### left_join() Returns all rows from the left table and 
### any rows with matching keys from the right table

df = df1 %>% left_join(df2, by='CustomerId')
df


### right_join() Returns all rows from the right table and 
### any rows with matching keys from the left table 

df = df1 %>% right_join(df2, by='CustomerId')
df


### semi_join() Returns only the left dataframe that matches with the right ###

df = df1 %>% semi_join(df2, by='CustomerId')
df


### anti_join() Selects all rows from df1 that are not present in df2 ###

df = df1 %>% anti_join(df2, by='CustomerId')
df



















