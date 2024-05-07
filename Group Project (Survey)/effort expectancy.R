library(readr)

data <- read_csv("Group Project (Survey)/data.csv")
View(data)

#effort expectancy
EE1 <- data$`
I have a clear grasp of using Canva, understanding its functionality and how to effectively manage projects within the platform.`
length(EE1)

EE1 <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree", NA, "Strongly Disagree")

tally_votes <- function(responses) {
  table(factor(responses, levels = c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")))
}

print(tally_votes(EE1))

print(prop.table(tally_votes(EE1)) * 100)

likert_to_numeric <- function(response) {
  likert_levels <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")
  numeric_values <- c(1, 2, 3, 4, 5)
  numeric_values[match(response, likert_levels)]
}

response <- "Strongly Disagree"
print(likert_to_numeric(response))

EE1 <- c(1, 2, 3, 4, 5, NA)
print(mean(EE1, na.rm = TRUE))
print(sd(EE1, na.rm = TRUE))


EE2 <- data$`It would be so easy for me to be skillful in using canva`
length(EE2)

likert_to_numeric <- function(response) {
  likert_levels <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")
  numeric_values <- c(1, 2, 3, 4, 5)
  
  numeric_response <- numeric_values[match(response, likert_levels)]
  return(numeric_response)
}

response <- "Disagree"
numeric_value <- likert_to_numeric(response)
print(numeric_value)
EE2 <- c(1, 2, 3, 4, 5, NA)
EE2_numeric <- likert_to_numeric(EE2)
any(is.na(EE2))
EE2_Mean <- mean(EE2, na.rm = TRUE)
EE2_SD <- sd(EE2, na.rm = TRUE)

EE2_Mean
EE2_SD

EE3 <- data$`I find canva easy to use.`
length(EE3)

likert_to_numeric <- function(response) {
  likert_levels <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")
  numeric_values <- c(1, 2, 3, 4, 5)
  
  numeric_response <- numeric_values[match(response, likert_levels)]
  return(numeric_response)
}

response <- "Disagree"
numeric_value <- likert_to_numeric(response)
print(numeric_value)
EE3 <- c(1, 2, 3, 4, 5, NA)
EE3_numeric <- likert_to_numeric(EE3)
any(is.na(EE3))
EE3_Mean <- mean(EE3, na.rm = TRUE)
EE3_SD <- sd(EE3, na.rm = TRUE)

EE3_Mean
EE3_SD
