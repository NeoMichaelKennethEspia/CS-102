library(dplyr)
library(readr)


cleaned <- read_csv("Activity#3/[CSV Files]/FinalMovie.csv")
str(cleaned)

cleaned_data <- cleaned %>% na.omit() %>%
mutate_all(str_trim)

str(cleaned_data)

write.csv(cleaned_data, "Cleaned_Data.csv", row.names = FALSE)
View(Cleaned_Data)