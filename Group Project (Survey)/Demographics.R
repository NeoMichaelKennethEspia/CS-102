library(dplyr)
library(tibble)
library(ggplot2)
library(readr)

data <- read_csv("Group Project (Survey)/data.csv")

#Removing the unnecessary columns (Timestamp, School Name, Section, and Course)
CleanedData <- data[, -c(1,7, 8, 9)]
view(CleanedData)

#Factor Gender
genderfactor<-factor(CleanedData$`Gender:`, levels = c("Straight", "Bisexual","Gay","Lesbian","Transgender","Non-binary/non-conforming","Prefer Not to Say"))
summary(genderfactor)

#Factor Sex
sexfactor<-factor(CleanedData$`SEX:`, levels = c("Male", "Female"))
summary(sexfactor)

#Factor Age 
#The data has "$1" as a value, converted it to "21"
CleanedData$`Age:`[CleanedData$`Age:` == "$1"] <- 21
# Convert Age: column to numeric
CleanedData$`Age:` <- as.numeric(CleanedData$`Age:`)

agefactor <- factor(CleanedData$`Age:`, levels = 11:23)
summary(agefactor)



#Graph for Gender
# Define custom colors for each category
custom_colors <- c("gray12", "midnightblue", "seagreen3", "sienna2", "lightpink2", "blue", "lightgoldenrod1")

# Create a pie chart for gender distribution with custom colors
GenderPie <- list(
  pie_chart = pie(gender_summary, 
                  main = "Gender Distribution", 
                  labels = names(gender_summary),
                  col = custom_colors,
                  border = "black"),
  
  # Add legend
  legend = legend("topright", 
                  legend = names(gender_summary),
                  fill = custom_colors,
                  bty = "n",
                  title = "Genders")
)


#Graph for Sex
pie(sex_summary, 
    main = "Sex Distribution", 
    labels = c(paste("Male (", sex_summary[1], ")", sep = ""), 
               paste("Female (", sex_summary[2], ")", sep = "")),
    col = c("skyblue", "pink3"),
    border = "black"
)

legend("topright", 
       legend = c(paste("Male (", sex_summary[1], ")", sep = ""), 
                  paste("Female (", sex_summary[2], ")", sep = "")),
       fill = c("skyblue", "pink3"),
       bty = "n",
       title = "Sex")

#Graph for Age
# Increase the size of the pie chart
par(mar = c(2, 2, 2, 2))  # Adjust margins if necessary
pie(age_summary, 
    main = "Age Distribution", 
    labels = c(paste(names(age_summary), " (", age_summary, ")", sep = "")),
    col = rainbow(length(age_summary)),
    border = "black",
    cex = 1.0 
)

legend("topright", 
       legend = c(paste(names(age_summary), " (", age_summary, ")", sep = "")),
       fill = rainbow(length(age_summary)),
       bty = "n",
       title = "Age",
       cex = 0.8)





