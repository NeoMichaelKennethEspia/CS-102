install.packages(c("rvest", "httr", "polite", "dplyr", "kableExtra"))

library(rvest)
library(httr)
library(dplyr)
library(polite)
library(kableExtra)

polite::use_manners(save_as = 'polite_scrape.R')
url <- 'https://www.amazon.com/s?k=mechanical+keyboard&crid=E5KN2TLWK2GH&sprefix=mechanicakeyboard%2Caps%2C418&ref=nb_sb_noss_2'

cat("URL:", url, "\n")

session <- bow(url, user_agent = "Educational")

BrandDescription <- character(0)
Price <- character(0)
No_of_Reviews <- character(0)
Review_Start <- character (0)

BrandDescription <- scrape(session) %>%
  html_nodes('a-size-medium a-color-base a-text-normal') %>%
  html_text()

BDesc <- data.frame(BrandDescription)

BDesc <- slice(BDesc, 1:3)

print(BDesc)

PPrice <- scrape(session) %>%
  html_nodes('a-price-whole') %>%
  html_text()

Price <- data.frame(PPrice)

Price <- Price(PPrice, 1:25)
print(Price)



colnames(title_list_sub) <- "ranks"

split_df <- strsplit(as.character(title_list_sub$ranks),".",fixed = TRUE)
split_df <- data.frame(do.call(rbind,split_df))


split_df <- split_df[-c(3:4)]
colnames(split_df) <- c("ranks","title")

str(split_df)
class(split_df)
head(split_df)

rank_title <- data.frame(rank_title = split_df)
write.csv(rank_title,file = "title.csv")


link_list <- scrape(session) %>%
  html_nodes("a.ipc-title-link-wrapper") %>%
  html_attr('href')

head(link_list)

link_list[245:257]

link <- as.vector(link_list[1:250])
names(link) <- "links"

head(link)
tail(link)


for (i in 1:250) {
  link[i] <- paste0("https://imdb.com", link[i], sep = "tt0903747")
}

links <- as.data.frame(link)

rank_title <- data.frame(rank_title = split_df, link)

scrape_df <- data.frame(rank_title,links)
names(scrape_df) <- c("Rank","Title","Link")

head(scrape_df)
write.csv(scrape_df,file = "top50.csv")