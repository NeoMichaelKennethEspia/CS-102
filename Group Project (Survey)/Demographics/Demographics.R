library(dplyr)
library(tibble)
library(ggplot2)
library(readr)
########################################################################################################################################################
data <- read_csv("Group Project (Survey)/data.csv")

#Removing the unnecessary columns (Timestamp, School Name, Section, and Course)
CleanedData <- data[, -c(1,7, 8, 9)]
view(CleanedData)

########################################################################################################################################################

#Factor Gender
CleanedData$`Gender:`[is.na(CleanedData$`Gender:`)] <- "Prefer Not To Say"
genderfactor <- factor(CleanedData$`Gender:`, levels = c("Straight", "Bisexual", "Gay", "Lesbian", "Transgender", "Non-binary/non-conforming", "Prefer Not To Say"))
summary(genderfactor)

########################################################################################################################################################

#Factor Sex
sexfactor<-factor(CleanedData$`SEX:`, levels = c("Male", "Female"))
summary(sexfactor)

########################################################################################################################################################

#Factor Age 
#The data has "$1" as a value, converted it to "21"
CleanedData$`Age:`[CleanedData$`Age:` == "$1"] <- 21
# Convert Age: column to numeric
CleanedData$`Age:` <- as.numeric(CleanedData$`Age:`)
agefactor <- factor(CleanedData$`Age:`, levels = 11:23)
summary(agefactor)

#Getting the mean for Age
age <- c(CleanedData$`Age:`)
average <- mean(age, na.rm = TRUE)
avg <- paste("The mean age of the respondents is", average)
print(avg)

########################################################################################################################################################


########################################################################################################################################################
#Graph for Gender
gender_counts <- table(genderfactor)

# Plot a pie chart
pie(gender_counts,
    main = "Gender Distribution",
    col = rainbow(length(gender_counts)),
    labels = paste(names(gender_counts), " (", gender_counts, ")", sep = ""),
    clockwise = TRUE,
    density = NULL,
    angle = 45,
    init.angle = 90,
    border = "white"
)

# Add a legend with counts
legend("topright",
       legend = paste(names(gender_counts), " (", gender_counts, ")", sep = ""),
       fill = rainbow(length(gender_counts)),
       title = "Gender"
)

############################################################################

############################################################################
#Graph for Sex
sex_table <- table(CleanedData$`SEX:`)

sex_colors <- c("pink", "skyblue")

pie(sex_table, 
    main = "Sex Distribution", 
    labels = paste(names(sex_table), " (", sex_table, ")", sep = ""),
    col = sex_colors
)
############################################################################

############################################################################
#Graph for Age
age_counts <- table(agefactor)
age_labels <- names(age_counts)

pie(age_counts, labels = age_labels, col = rainbow(length(age_counts)), main = "Age Distribution")
legend("topright", legend = paste(age_labels, ": ", age_counts), fill = rainbow(length(age_counts)))

########################################################################




