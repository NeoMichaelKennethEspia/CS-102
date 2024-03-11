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
      mean(warpbreaks$tension)
      #Warning message:
      #In mean.default(warpbreaks$tension):argument is not numeric or logical: returning NA
      
#B. Load the exampleFile.txt

#1. Read the complete file using readLines.
    read.csv("exampleFile.txt")
    
#2. Separate the vector of lines into a vector containing comments and a vector containing the data.
    (textS <- readLines("exampleFile.txt"))
    I <- grepl("^//", textS)
    (Sep <- textS[!I])
#3 Extract the date from the first comment line.  
    library(stringr)
    (line_1 <- textS[[1]])
    r <- as.data.frame(strsplit(line_1,":"))
    (r <- str_trim(r[2,]))
    library(lubridate)
    date_convert <- dmy(r)
    format(date_convert, format = "It was created %B %d,%Y")  
    
#4. Read the data into a matrix as follows.
    
    #a. Split the character vectors in the vector containing data lines by semicolon (;) using strsplit.
    Sep
    (namelist <- strsplit(Sep, split = ";"))      
    length(namelist)    
    (namelist <- strsplit(Sep, split = ";"))
    
    #b. Find the maximum number of fields retrieved by split. Append rows that are shorter with NA's. 
    length(namelist)
    d_sub <- gsub("57,2","57.2",namelist[[3]])
    namelist[[3]] <- d_sub
    namelist    
    
    clean_data <- function(vec) {
      #Cleaning the data to make it presentable
      vec[1] <- tolower(sub("fem\\.", "Female", sub("M", "Male", vec[1])))
     
      #Convert!
      vec[2:3] <- as.numeric(vec[2:3])
      return(vec)
    } 
    
    (cleaned <- lapply(namelist, clean_data))    
    
    #c. Use unlist and matrix to transform the data to row-column format.
    (UnMat <- matrix(
      unlist(cleaned),
      nrow=length(cleaned),
      byrow=TRUE))
    #d. From comment lines 2-4, extract the names of the fields. Set these as colnames for the matrix you just created.
    colnames(UnMat) <- c("Gender","Age","Weight")    
    (FinalData <- as.data.frame(UnMat, stringsAsFactors=FALSE))    
    FinalData$Age <- as.numeric(FinalData$Age)
    FinalData$Weight <- as.numeric(FinalData$Weight)
    FinalData    
    