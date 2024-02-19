install.packages("rvest")
install.packages("httr")
install.packages("polite")

library(rvest)
library(httr)
library(polite)



polite::use_manners(save_as = 'polite_scrape.R')

url1 <- 'https://www.imdb.com/title/tt7798634/reviews/_ajax?ref_=undefined&paginationKey=%s'


scrape_page <- function(url1, PaginationKey) {
  session <- bow(sprintf(url1, PaginationKey), user_agent = "Educational")
  
  Usernames <- scrape(session) %>% html_nodes('span.display-name-link') %>% html_text()
  ReviewerDates <- scrape(session) %>% html_nodes('span.review-date') %>% html_text()
  ReviewerContents <- scrape(session) %>% html_nodes('div.text.show-more__control') %>% html_text()
  Ratings <- scrape(session) %>% html_nodes('span.rating-other-user-rating') %>% html_text()
  PaginationKey <- scrape(session) %>% html_nodes("div.load-more-data") %>% html_attr("data-key")
  
  return(list(Usernames = Usernames, ReviewerDates = ReviewerDates, ReviewerContents = ReviewerContents, Ratings = Ratings, PaginationKey = PaginationKey))
}

Usernames <- character(0)
ReviewerDates <- character(0)
ReviewerContents <- character(0)
Ratings <- character(0)
PaginationKey <- ""


reviews_to_scrape <- 300
per_page <- 25
pages_to_scrape <- ceiling(reviews_to_scrape / per_page)

for (page in 1:pages_to_scrape) {
  scraped_data <- scrape_page(url1, PaginationKey)
  
  Usernames <- c(Usernames, scraped_data$Usernames)
  ReviewerDates <- c(ReviewerDates, scraped_data$ReviewerDates)
  ReviewerContents <- c(ReviewerContents, scraped_data$ReviewerContents)
  Ratings <- c(Ratings, scraped_data$Ratings)
  
  PaginationKey <- scraped_data$PaginationKey
  
  if (length(Usernames) >= reviews_to_scrape) {
    break
  }
}



DataFrame <- data.frame(
  Usernames = Usernames[1:300],
  Reviewer_Date = ReviewerDates[1:300],
  Reviewer_Content = ReviewerContents[1:300],
  Rating = Ratings[1:300]
)



write.csv(DataFrame, file = "1First.csv", row.names = FALSE)
print(DataFrame)
