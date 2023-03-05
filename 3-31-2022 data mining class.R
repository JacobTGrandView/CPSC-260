library(tidyverse)
library(rvest)

### Web scraping ###

webpage = read_html('http://books.toscrape.com/')
webpage %>% html_nodes('a') %>% html_text()
webpage %>% html_nodes('h3') %>% html_text()

webpage %>% html_nodes('h3 a') %>% html_text()

webpage %>% html_nodes('a') %>% html_attr('title')

webpage %>% html_nodes('p.price_color') %>% html_text()
webpage %>% html_nodes('p.instock.availability') %>% html_text()

webpage %>% html_nodes('p.instock.availability') %>% html_text(trim = T)

webpage %>% html_nodes('p.star-rating') %>% html_attr('class')

imgsrc = webpage %>% html_nodes('img') %>% html_attr('src')

URL = 'http://books.toscrape.com'
download.file(paste0(URL, imgsrc), destfile=basename(imgsrc))



































