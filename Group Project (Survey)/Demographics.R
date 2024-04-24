surveydata <- read_csv("Survey Data/surveydata.csv")

#Factor Gender
genderfactor<-factor(surveydata$`Gender:`, levels = c("Straight", "Bisexual","Gay","Lesbian","Transgender","Non-binary/non-conforming","Prefer Not to Say"))
summary(genderfactor)

gender_summary <- table(genderfactor)

#Factor Sex
sexfactor<-factor(surveydata$`SEX:`, levels = c("Male", "Female"))
summary(sexfactor)

sex_summary <- table(sexfactor)


#Factor Age 
agefactor<-factor(surveydata$`Age:`, levels = c(11,12,13,14,15,16,17,18,19,20,21,22,23))
summary(agefactor)

age_summary <- table(agefactor)

#Cleaning School Data
schooldata <-surveydata$`School Name:`


school<- gsub("Iloilo Scienc and Technology University| Iloilo science and technology University |Iloilo Science and Technology University | ILOILO SCIENCE AND TECHNOLOGY UNIVERSITY |ISATU |ISATU MAIN  ", "Iloilo Science and Technology University", surveydata$`School Name:`)
school



#Factor
schooldata<-factor(schooldata)
summary(schooldata)





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
