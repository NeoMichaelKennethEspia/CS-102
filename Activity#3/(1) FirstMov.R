install.packages("rvest")
install.packages("httr")
install.packages("polite")

library(rvest)
library(httr)
library(polite)

polite::use_manners(save_as = 'polite_scrape.R')

url <- 'https://www.imdb.com/title/tt7798634/reviews?ref_=tt_urv'

session <- bow(url,
               user_agent = "Educational")
session


div_elements <- html_nodes(session_page, 'review-container')

Username <- character(0)
ReviewerDate <- character(0)
ReviewerContent <- character(0)
Rating <- character(0)

for (page in 1:12) 
  Username <- scrape (session) %>%
  html_nodes('span.display-name-link')%>%
  html_text
Username

ReviewerDate <- scrape (session) %>%
  html_nodes('span.review-date')%>%
  html_text
ReviewerDate

ReviewerContent <- scrape (session) %>%
  html_nodes('div.text.show-more__control')%>%
  html_text
ReviewerContent


Rating <- scrape (session) %>%
  html_nodes('span.rating-other-user-rating')%>%
  html_text
Rating

DataFrame <- data.frame(Usernames = Username,
                        Reviewer_Date =ReviewerDate,
                        Reviewer_Content = ReviewerContent,
                        Rating = Rating)


write.csv(DataFrame, "FirstMov.csv")
print(FirstMov.csv)

