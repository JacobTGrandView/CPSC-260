### Data mining final project ###
library(rvest)
library(dplyr)
library(ggplot2)
install.packages('plotly')
library(plotly)
install.packages('viridis')
library(viridis)
install.packages('hrbrthemes')
library(hrbrthemes)



## Points per game leaderboard for current players ##
PPGleader = read_html('https://www.basketball-reference.com/leaders/pts_per_g_active.html')


## Assists per game leaderboard for current players ##
APGleader = read_html('https://www.basketball-reference.com/leaders/ast_per_g_active.html')


## Salary rankings for current players ##
NBAsalary = read_html('https://www.spotrac.com/nba/rankings/')


## Top 100 current players for PPG ## 
PPGtable = PPGleader %>% html_nodes('table') %>% html_table()
PPGtable1 = PPGtable[[1]]
view(PPGtable1)
head(PPGtable1)


## Top 100 current players for APG ##
APGtable = APGleader %>% html_nodes('table') %>% html_table()
APGtable1 = APGtable[[1]]
view(APGtable1)
head(APGtable1)


## 2021-2022 NBA player contracts page 1 ##
SalaryTable = NBAsalary %>% html_nodes('table') %>% html_table()
SalaryTable1 = SalaryTable[[1]]
view(SalaryTable1)
head(SalaryTable1)

SalaryTable2 = SalaryTable1

#Add first column name to be Rank. It was blank
colnames(SalaryTable2)[1] = 'Rank'
view(SalaryTable2)

#Renaming the column name
colnames(SalaryTable2)
colnames(SalaryTable2)[5] = 'Salary'
view(SalaryTable2)

#Only selecting Rank, Player, and Salary. Don't need age or position
SalaryTable3 = SalaryTable2 %>%
  select(Rank, Player, Salary)
view(SalaryTable3)

#Filling in the NA rank values
SalaryTable4 = SalaryTable3
SalaryTable4[3,1] = 3
SalaryTable4[8,1] = 8
SalaryTable4[9,1] = 9
SalaryTable4[10,1] = 10
SalaryTable4[20,1] = 20
SalaryTable4[23,1] = 23
SalaryTable4[24,1] = 24
SalaryTable4[26,1] = 26
SalaryTable4[27,1] = 27
SalaryTable4[34,1] = 34
SalaryTable4[36,1] = 36
SalaryTable4[37,1] = 37
SalaryTable4[38,1] = 38
SalaryTable4[65,1] = 65
SalaryTable4[72,1] = 72
SalaryTable4[78,1] = 78
SalaryTable4[99,1] = 99

view(SalaryTable4)

#Fixing all of the player names in the Salary Table. They repeat for some reason
SalaryTable5 = SalaryTable4
SalaryTable5[1,2] = 'Stephen Curry'
SalaryTable5[2,2] = 'James Harden'
SalaryTable5[3,2] = 'John Wall'
SalaryTable5[4,2] = 'Russell Westbrook'
SalaryTable5[5,2] = 'Kevin Durant'
SalaryTable5[6,2] = 'LeBron James'
SalaryTable5[7,2] = 'Paul George'
SalaryTable5[8,2] = 'Kawhi Leonard'
SalaryTable5[9,2] = 'Damian Lillard'
SalaryTable5[10,2] = 'Giannis Antetokounmpo'
SalaryTable5[11,2] = 'Klay Thompson'
SalaryTable5[12,2] = 'Jimmy Butler'
SalaryTable5[13,2] = 'Tobias Harris'
SalaryTable5[14,2] = 'Khris Middleton'
SalaryTable5[15,2] = 'Anthony Davis'
SalaryTable5[16,2] = 'Rudy Gobert'
SalaryTable5[17,2] = 'Kyrie Irving'
SalaryTable5[18,2] = 'Bradley Beal'
SalaryTable5[19,2] = 'Ben Simmons'
SalaryTable5[20,2] = 'Pascal Siakam'
SalaryTable5[21,2] = 'Jrue Holiday'
SalaryTable5[22,2] = 'Kristaps Porzingis'
SalaryTable5[23,2] = 'Devin Booker'
SalaryTable5[24,2] = 'Karl-Anthony Towns'
SalaryTable5[25,2] = 'Joel Embiid'
SalaryTable5[26,2] = 'Nikola Jokic'
SalaryTable5[27,2] = 'Andrew Wiggins'
SalaryTable5[28,2] = 'Kevin Love'
SalaryTable5[29,2] = 'C.J. McCollum'
SalaryTable5[30,2] = 'Chris Paul'
SalaryTable5[31,2] = "D'Angelo Russell"
SalaryTable5[32,2] = 'Gordon Hayward'
SalaryTable5[33,2] = 'Jamal Murray'
SalaryTable5[34,2] = 'Brandon Ingram'
SalaryTable5[35,2] = 'Donovan Mitchell'
SalaryTable5[36,2] = 'Bam Adebayo'
SalaryTable5[37,2] = "De'Aaron Fox"
SalaryTable5[38,2] = 'Jayson Tatum'
SalaryTable5[39,2] = 'Al Horford'
SalaryTable5[40,2] = 'Kyle Lowry'
SalaryTable5[41,2] = 'DeMar DeRozan'
SalaryTable5[42,2] = 'Jaylen Brown'
SalaryTable5[43,2] = 'Draymond Green'
SalaryTable5[44,2] = 'Nikola Vucevic'
SalaryTable5[45,2] = 'Buddy Hield'
SalaryTable5[46,2] = 'John Collins'
SalaryTable5[47,2] = 'Julius Randle'
SalaryTable5[48,2] = 'Malcolm Brogdon'
SalaryTable5[49,2] = 'Tim Hardaway Jr.'
SalaryTable5[50,2] = 'Mike Conley'
SalaryTable5[51,2] = 'Gary Harris'
SalaryTable5[52,2] = 'Danilo Gallinari'
SalaryTable5[53,2] = 'Harrison Barnes'
SalaryTable5[54,2] = 'Jerami Grant'
SalaryTable5[55,2] = 'Jarrett Allen'
SalaryTable5[56,2] = 'Domantas Sabonis'
SalaryTable5[57,2] = 'Fred VanVleet'
SalaryTable5[58,2] = 'Zach LaVine'
SalaryTable5[59,2] = 'Bojan Bogdanovic'
SalaryTable5[60,2] = 'Lonzo Ball'
SalaryTable5[61,2] = 'Clint Capela'
SalaryTable5[62,2] = 'Eric Gordon'
SalaryTable5[63,2] = 'Eric Bledsoe'
SalaryTable5[64,2] = 'Myles Turner'
SalaryTable5[65,2] = 'Bogdan Bogdanovic'
SalaryTable5[66,2] = 'Terry Rozier'
SalaryTable5[67,2] = 'Ricky Rubio'
SalaryTable5[68,2] = 'Caris LeVert'
SalaryTable5[69,2] = 'Jonathan Isaac'
SalaryTable5[70,2] = 'Joe Harris'
SalaryTable5[71,2] = 'Evan Fournier'
SalaryTable5[72,2] = 'Spencer Dinwiddie'
SalaryTable5[73,2] = 'Steven Adams'
SalaryTable5[74,2] = 'Markelle Fultz'
SalaryTable5[75,2] = 'Aaron Gordon'
SalaryTable5[76,2] = 'OG Anunoby'
SalaryTable5[77,2] = 'Gary Trent Jr.'
SalaryTable5[78,2] = 'Davis Bertans'
SalaryTable5[79,2] = 'Lauri Markkanen'
SalaryTable5[80,2] = 'Duncan Robinson'
SalaryTable5[81,2] = 'Marcus Morris Sr.'
SalaryTable5[82,2] = 'Will Barton'
SalaryTable5[83,2] = 'Norman Powell'
SalaryTable5[84,2] = 'Dejounte Murray'
SalaryTable5[85,2] = 'Derrick White'
SalaryTable5[86,2] = 'Malik Beasley'
SalaryTable5[87,2] = 'Marcus Smart'
SalaryTable5[88,2] = 'Patrick Beverley'
SalaryTable5[89,2] = 'Thaddeus Young'
SalaryTable5[90,2] = 'Jonas Valanciunas'
SalaryTable5[91,2] = 'Doug McDermott'
SalaryTable5[92,2] = 'Christian Wood'
SalaryTable5[93,2] = 'Derrick Rose'
SalaryTable5[94,2] = 'Luke Kennard'
SalaryTable5[95,2] = 'Brook Lopez'
SalaryTable5[96,2] = 'Kentavious Caldwell-Pope'
SalaryTable5[97,2] = 'Joe Ingles'
SalaryTable5[98,2] = 'Kyle Kuzma'
SalaryTable5[99,2] = 'Taurean Prince'
SalaryTable5[100,2] = 'Robert Covington'

View(SalaryTable5)


## Merging all of the data into 1 ##

PPGtable2 = PPGtable1
APGtable2 = APGtable1
SalaryTable6 = SalaryTable5

#Joining PPG and APG by player
NBAmerged = inner_join(PPGtable2, APGtable2, by = 'Player') #Joining the data that finds the same player name in both data
view(NBAmerged)

#Joining Salaries with PPG and APG by player
NBAmerged2 = inner_join(NBAmerged, SalaryTable6, by = 'Player') #Joining PPG, APG, and salaries that match player names in all 3 data sets
view(NBAmerged2)


## NBA players birthplace ##
NBAbirthplace = read_html('https://www.nba.com/players')


## Birthplace of all current NBA players ##
NBAbirthTable = NBAbirthplace %>% html_nodes('table') %>% html_table()
NBAbirthTable1 = NBAbirthTable[[1]]
head(NBAbirthTable1)
view(NBAbirthTable1)





### Fixing the players not having spaces between first and last name ###


PlayerName = NBAmerged2
view(PlayerName)


PlayerName = gsub(' ', '', PlayerName$Player)
view(PlayerName)
NBAmergedTest = data.frame(NBAmerged2, PlayerName)
view(NBAmergedTest)


NBAbirthTable2 = NBAbirthTable1
NBAbirthTable2 = rename(NBAbirthTable1, College = 'Last Attended')
view(NBAbirthTable2)


NBAbirthTable3 = NBAbirthTable2
NBAbirthTable3 = NBAbirthTable2 %>%
  select(Player, College, Country)
view(NBAbirthTable3)


NBAbirthTable4 = NBAbirthTable3
view(NBAbirthTable4)


NBAbirthTable4 = rename(NBAbirthTable4, PlayerName = 'Player')
view(NBAbirthTable4)


view(NBAmergedTest)
NBAmergedTest1 = NBAmergedTest
view(NBAmergedTest1)
NBAmergedTest1 = inner_join(NBAbirthTable4, NBAmergedTest1, by = 'PlayerName')




### Remove one of the player columns since there are 2 ###
NBAmergedTest2 = NBAmergedTest
NBAmergedTest3 = NBAmergedTest2 %>% select(-Player)
view(NBAmergedTest3)


### Reorder columns ### 
NBAmergedTest4 = NBAmergedTest3 %>% select(PlayerName, Salary, Rank, PPG, Rank.x, APG, Rank.y)
view(NBAmergedTest4)


### Rename ranks to fit their stat ###
NBAmergedTest5 = NBAmergedTest4
NBAmergedTest5 = rename(NBAmergedTest5, SalaryRank = 'Rank')
NBAmergedTest5 = rename(NBAmergedTest5, PPGrank = 'Rank.x')
NBAmergedTest5 = rename(NBAmergedTest5, APGrank = 'Rank.y')
view(NBAmergedTest5)



### Graphing ###


#Scatter plot
NBAmergedTest6 = NBAmergedTest5
ggplot(NBAmergedTest6, mapping=aes(x=PPG, y= APG, color=Salary))+
  geom_point()

  
#Simple bubble plot
NBAmergedTest6 %>%
  arrange(desc(Salary)) %>%
  ggplot(aes(x=PPG, y=APG, size=Salary, color=PlayerName)) +
  geom_point(alpha=.5)


#Interactive Bubble plot
InteractiveBubblePlot = NBAmergedTest6 %>%
  arrange(desc(Salary)) %>%
  ggplot(NBAmergedTest6, mapping=aes(x=PPG, y=APG, size=Salary, fill=PlayerName))+
  geom_point(alpha=0.5, shape=21, color="black")+
  theme_ipsum()+
  theme(legend.position="bottom") +
  ylab("APG")+
  xlab("PPG")

ggplotly(InteractiveBubblePlot)


#Simpler Interactive Bubble plot
InteractiveBubblePlot <- NBAmergedTest6 %>%
  ggplot(aes(PPG, APG, size = Salary, color=PlayerName))+
  geom_point(alpha=.7)+
  theme_bw()

ggplotly(InteractiveBubblePlot)


#PPG vs APG bubble plot
PPGvsAPG = NBAmergedTest6 %>%
  ggplot(aes(PPG, APG, color=PlayerName))+
  geom_point(alpha=.7)+
  theme_bw()

ggplotly(PPGvsAPG)


#APG vs Salary bubble plot
APGvsSalary = NBAmergedTest6 %>%
  ggplot(aes(APG, Salary, color=PlayerName))+
  geom_point(alpha=.7)+
  theme_bw()

ggplotly(APGvsSalary)


#PPG vs Salary bubble plot
PPGvsSalary = NBAmergedTest6 %>%
  ggplot(aes(PPG, Salary, color=PlayerName))+
  geom_point(alpha=.7)+
  theme_bw()

ggplotly(PPGvsSalary)








