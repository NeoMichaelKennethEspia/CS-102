library(readr)
library(readxl)
library(dplyr)
library(knitr)

CleanedData <- read_csv("Group Project (Survey)/Answers/CleanedData.csv")
view(CleanedData)


# Find mean and standard deviation
PE1 <- CleanedData$`How do you use canva? (Check all boxes that apply)`
length(PE1)
(PEMean <- mean(PE1))
(PESD<- sd(PE1))

# Find mean and standard deviation
PE2 <- CleanedData$`Have you used Canva to help with any assignments or projects connected to your studies?`
length(PE2)
PE2Mean <- mean(PE2)
PE2SD<- sd(PE2)

# Find mean and standard deviation
PE3 <- CleanedData$`Have you used Canva to help with any assignments or projects connected to your studies?`
length(PE3)
PE3Mean <- mean(PE3)
PE3SD<- sd(PE3)

PE4 <- CleanedData$`using Canva for school-related work helps ME complete assignments more quickly.`
length(PE4)
PE4Mean <- mean(PE4)
PE4SD<- sd(PE4)

PE5 <- CleanedData$`using Canva to organize My schoolwork makes Me more productive.`
length(PE5)
PE5Mean <- mean(PE5)
PE5SD<- sd(PE5)

PE6 <- CleanedData$`If I use canva for My school projects, It would increase My chances of receiving praise or succeeding academically.`
length(PE6)
PE6Mean <- mean(PE6)
PE6SD<- sd(PE6)







EE1 <- data$`
I have a clear grasp of using Canva, understanding its functionality and how to effectively manage projects within the platform.`


likert_to_numeric <- function(response) {
  likert_levels <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")
  numeric_values <- c(1, 2, 3, 4, 5)
  
  numeric_response <- numeric_values[match(response, likert_levels)]
  return(numeric_response)
}

response <- "Strongly Disagree"
numeric_value <- likert_to_numeric(response)
print(numeric_value)

EE1 <- c(1, 2, 3, 4, 5, NA)
EE1_numeric <- likert_to_numeric(EE1)
any(is.na(EE1))

length(EE1_numeric)
EE1_Mean <- mean(EE1, na.rm = TRUE)
EE1_SD <- sd(EE1, na.rm = TRUE)

EE1_Mean
EE1_SD