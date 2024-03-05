#A. Load the built-in warpbreaks.

#1. Find out, in a single command, which columns of warpbreaks are either numeric or integer.
      warpbreaks
      str(warpbreaks)
#2. Is numeric a natural data type for the columns which are stored as such? Convert to integer when necessary.
      #Yes, numeric is a natural data type for columns which are store as such.
      class(warpbreaks$breaks)
      (ConvW <- as.integer(warpbreaks$breaks))
      class(warpbreaks$breaks)
      
#3. 
      

      
      
#B. Load the exampleFile.txt

#1. Read the complete file using readLines.
    read.csv("exampleFile.txt")
    
#2. Separate the vector of lines into a vector containing comments and a vector containing the data.
    (txt<- readLines("exampleFile.txt"))
    clean<-grepl("^//",txt)      
    (data<-txt[!clean])
    
    (data2 <- strsplit(data,split =";"))

      
    data3 <- function(x){
    out<-character(3)
    #Gender
    da<- grepl("[[:alpha:]]",x)  
    out[1] <-x[da]
    
    #Age
    da<-which(as.numeric(x)<64)
    out[2] <-ifelse(length(da)>0, x[da],NA)
    
    #Weight 
    da<-which(as.numeric(x)<82)
    out[3] <-ifelse(length(da)>0, x[da],NA)
    out
    }
    
    (standardFields<- lapply(data2, data3))
  
      