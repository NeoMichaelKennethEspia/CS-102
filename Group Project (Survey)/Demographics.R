surveydata <- read_csv("Survey Data/surveydata.csv")

#Factor Gender
surveydata$gender<-factor(surveydata$`Gender:`, levels = c("Straight", "Bisexual","Gay","Lesbian","Transgender","Non-binary/non-conforming","Prefer Not to Say"))
summary(surveydata$gender)

gender_summary <- table(surveydata$gender)

#Graph for Gender
barplot(gender_summary, 
        main = "Gender Distribution", 
        xlab = "Genders", 
        ylab = "Frequency",
        col = "darkolivegreen3", 
        border = "darkolivegreen", 
        ylim = c(0, max(gender_summary) * 1.1), 
        space = 0.5
)

#Factor Sex
surveydata$sex<-factor(surveydata$`SEX:`, levels = c("Male", "Female"))
summary(surveydata$sex)

sex_summary <- table(surveydata$sex)

#Graph for Sex
barplot(sex_summary, 
        main = "Sex Distribution", 
        xlab = "Sex", 
        ylab = "Frequency",
        col = "lightsteelblue2", 
        border = "black", 
        ylim = c(0, max(sex_summary) * 1.1), 
        space = 0.5
)

#Factor Age 
surveydata$age<-factor(surveydata$`Age:`, 11:23,  levels = c(11,12,13,14,15,16,17,18,19,20,21,22,23))
summary(surveydata$age)

age_summary <- table(surveydata$age)

#Graph for Age
barplot(age_summary, 
        main = "Age Distribution", 
        xlab = "Age", 
        ylab = "Frequency",
        col = "slateblue3", 
        border = "black", 
        ylim = c(0, max(age_summary) * 1.1), 
        space = 0.5
)

#Cleaning School Data
schooldata <-surveydata$`School Name:`

#Factor
schooldata<-factor(schooldata)
summary(schooldata)


school<- gsub("Iloilo Scienc and Technology University| Iloilo science and technology University |Iloilo Science and Technology University | ILOILO SCIENCE AND TECHNOLOGY UNIVERSITY |ISATU |ISATU MAIN  ", "Iloilo Science and Technology University", surveydata$`School Name:`)
school
