library(rvest)
library(dplyr)
library(stringr)

url1 <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

rankP1 <- url1 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("([0-9]+)\\.") %>%
  as.numeric()

nameP1 <- url1 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("[0-9]+\\. (.+) \\([0-9]{4}\\)", group = 1)

yearP1 <- url1 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("\\(([0-9]{4})\\)",group = 1) %>%
  as.numeric()

#rateP1 <- url1 %>%
#  read_html() %>%
#  html_elements("span.certificate") %>%
#  html_text2()

runtimeP1 <- url1 %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2()

genreP1 <- url1 %>%
  read_html() %>%
  html_elements("span.genre") %>%
  html_text2()

scoresP1 <- url1 %>%
  read_html() %>%
  html_elements("div.inline-block.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

directorP1 <- url1 %>%
  read_html() %>%
  html_elements("div.lister-item-content") %>%
  html_text2() %>%
  str_extract("Director(.+) \\|", group = 1) %>%
  str_remove("s: ") %>%
  str_remove(": ")

starsP1 <- url1 %>%
  read_html() %>%
  html_elements("div.lister-item-content") %>%
  html_text2() %>%
  str_extract("Stars: (.+)", group = 1)

votesP1 <- url1 %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2() %>%
  str_extract("Votes: (.+) \\|", group = 1) %>%
  str_remove("Gross:.+") %>%
  str_remove(" \\| ") %>%
  str_remove_all("\\,") %>%
  as.numeric()

grossP1 <- url1 %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2() %>%
  str_extract("Gross: (.+) \\|", group = 1) %>%
  str_remove_all("[$]") %>%
  str_remove_all("[M]") %>%
  as.numeric()

#-------------------------------------------

url2 <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc&start=51&ref_=adv_nxt"

rankP2 <- url2 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("([0-9]+)\\.") %>%
  as.numeric()

nameP2 <- url2 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("[0-9]+\\. (.+) \\([0-9]{4}\\)", group = 1)

yearP2 <- url2 %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>% 
  html_text2() %>%
  str_extract("\\(([0-9]{4})\\)",group = 1) %>%
  as.numeric()

#rateP2 <- url2 %>%
#  read_html() %>%
#  html_elements("span.certificate") %>%
#  html_text2()

runtimeP2 <- url2 %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2()

genreP2 <- url2 %>%
  read_html() %>%
  html_elements("span.genre") %>%
  html_text2()

scoresP2 <- url2 %>%
  read_html() %>%
  html_elements("div.inline-block.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

directorP2 <- url2 %>%
  read_html() %>%
  html_elements("div.lister-item-content") %>%
  html_text2() %>%
  str_extract("Director(.+) \\|", group = 1) %>%
  str_remove("s: ") %>%
  str_remove(": ")

starsP2 <- url2 %>%
  read_html() %>%
  html_elements("div.lister-item-content") %>%
  html_text2() %>%
  str_extract("Stars: (.+)", group = 1)

votesP2 <- url2 %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2() %>%
  str_extract("Votes: (.+) \\|", group = 1) %>%
  str_remove("Gross:.+") %>%
  str_remove(" \\| ") %>%
  str_remove_all("\\,") %>%
  as.numeric()

grossP2 <- url2 %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2() %>%
  str_extract("Gross: (.+) \\|", group = 1) %>%
  str_remove_all("[$]") %>%
  str_remove_all("[M]") %>%
  as.numeric()

#-------------------------------------------

imdb_df <- data.frame(rank=c(rankP1, rankP2),
                  name=c(nameP1, nameP2),
                  year=c(yearP1, yearP2),
#                  rate=c(rateP1, rateP2),
                  runtime=c(runtimeP1, runtimeP2),
                  genre=c(genreP1, genreP2),
                  scores=c(scoresP1, scoresP2),
                  director=c(directorP1, directorP2),
                  stars=c(starsP1, starsP2),
                  votes=c(votesP1, votesP2),
                  gross=c(grossP1, grossP2)
                  )


