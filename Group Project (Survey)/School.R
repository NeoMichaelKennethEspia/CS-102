
surveydata <- read_csv("Survey Data/surveydata.csv")

#Separating the column 
schooldata <-surveydata$`School Name:`

#Factor
schooldata<-factor(schooldata)
schooldata      

surveydata$`School Name` <- gsub("Iloilo Science and Technology University|ISATU|Iloilo Scienc and Technology University|Iloilo science and technology University|ISAT U","Iloilo Science and Technology University", surveydata$`School Name:`)
surveydata$`School Name` <- gsub("CPU|CENTRAL PHILIPPINE UNIVERSITY|Cpu","Central Philippine Univeristy", surveydata$`School Name:`)

# Write the modified data frame to a new CSV file
write.csv(surveydata, "cleanedschool.csv", row.names = FALSE)

data$Name.of.your.School <- gsub("Iloilo Science and Technology University|Iloilo science and technology|ISAT-U|Isatu|ISATU MAIN CAMPUS|Iloilo science and technology university|ISATU MAIN CAMPUS|ISATU MAIN|ISAT U|Isat u|iloilo Science and Technology University|ISATU", "Iloilo Science and Technology University", data$Name.of.your.School)

data$Name.of.your.School <- gsub("University of Iloilo|UI|UNIVERSITY OF ILOILO|PHINMA - UNIVERSITY OF ILOILO", "Phinma University of Iloilo", data$Name.of.your.School)

data$Name.of.your.School <- gsub("iloilo doctors college|IDC|Iloilo Doctors College", "Iloilo Doctor's College", data$Name.of.your.School)

data$Name.of.your.School <- gsub("ISUFST", "Iloilo State University of Fisheries Sciences and Technology", data$Name.of.your.School)
View(data)