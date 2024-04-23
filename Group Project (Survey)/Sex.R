surveydata <- read_csv("Survey Data/surveydata.csv")

#Separating the column 
sexdata <-surveydata$`SEX:`

#Factor
sexdata<-factor(sexdata)
sexdata       
