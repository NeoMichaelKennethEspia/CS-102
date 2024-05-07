library(readr)

data <- read_csv("Group Project (Survey)/data.csv")
View(data)

#effort expectancy
EE1 <- data$`
I have a clear grasp of using Canva, understanding its functionality and how to effectively manage projects within the platform.`
length(EE1)