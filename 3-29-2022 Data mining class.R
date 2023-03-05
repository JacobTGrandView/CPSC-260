### Web scraping ###

#Web scraping is the process of extracting info from a 
#webpage by taking advantage of the underlying html & css code


### Things you need to know ###

#1) Consists of tags (css tags)
#2) Tags can have attributes
#3) Tags can be nested


### HTML examples ###

#<h1> - largest heading
#<p> - paragraph
#<table> - tables
#<body> - body of web page


### Looking at the 2022 commencement and honors convocation speakers article on GV my view ###

#<h1> 2022 commencement...</h1>
#h1 tag has id attribute

#key = figure out what combo of tags and attributes are
#associated with the data you want


### Web scraping a webpage on GV myView ###

install.packages('rvest')
library(rvest)

myView.page = read_html("https://www.grandview.edu/about/community/news/2022-commencement-speakers")

nodes.h1=html_nodes(myView.page, 'h1') #Shows the line of text on the webpage that uses h1
nodes.h1=myView.page %>% html_nodes('h1') #Same thing as line 36 using pipe notation
nodes.h1

title = html_text(nodes.h1)
title

title = myView.page %>% html_nodes('h1') %>% html_text() #Put that all together using 1 line


myView.page %>% html_nodes('span') %>% html_text()
myView.page %>% html_nodes('span.publish-date') %>% html_text()
#Use a period between tag and class attribute

myView.page %>% html_nodes('.publish-date') %>% html_text()
#It is ok to just use attribute


### Web scraping the Barnes and Noble website ###

BarnesAndNoble = read_html('https://www.barnesandnoble.com/b/the-new-york-times-bestsellers/_/N-1p3n')
BarnesAndNoble %>% html_nodes('span.text') %>% html_text()


### Web scraping imbd website ### 

imbd = read_html('https://www.imdb.com/what-to-watch/fan-favorites/?ref_=watch_wchgd_tab')
imbd %>% html_nodes('h1.ipc-title__text') %>% html_text() #The h1 of the page
imbd %>% html_nodes("div.ipc-button__text") %>% html_text() #the clickable buttons at the top of the page

### Web scraping a wikipedia table ###

wiki.page = read_html("https://en.wikipedia.org/wiki/List_of_largest_empires")
tables = wiki.page %>% html_nodes('table') %>% html_table()
tables





