mov1 <- read.csv("Activity#3/[CSV Files]/1First.csv")
mov2 <- read.csv("Activity#3/[CSV Files]/2SecondMov.csv")
mov3 <- read.csv("Activity#3/[CSV Files]/3ThirdMov.csv")
mov4 <- read.csv("Activity#3/[CSV Files]/4FourthMov.csv")
mov5 <- read.csv("Activity#3/[CSV Files]/5FifthMov.csv")
mov6 <- read.csv("Activity#3/[CSV Files]/6SixthMov.csv")
mov7 <- read.csv("Activity#3/[CSV Files]/7SeventhMov.csv")
mov8 <- read.csv("Activity#3/[CSV Files]/8EightMov.csv")
mov9 <- read.csv("Activity#3/[CSV Files]/9NinthMov.csv")
mov10 <-read.csv("Activity#2/0ZeroMov.csv")

merged_movies <- rbind(mov1, mov2, mov3, mov4, mov5, mov6, mov7,mov8,mov9,mov10)

write.csv(merged_movies, "FinalMovie.csv", row.names = FALSE)
