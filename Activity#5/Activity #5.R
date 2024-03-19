install.packages("dplyr")
library(dplyr)

data <- read_csv("Activity#3/[CSV Files]/FinalMovie.csv")
data    

# Ratings 
  Rate <- data %>% filter(Rating < 9)
  Rate
  
head(Rate)


