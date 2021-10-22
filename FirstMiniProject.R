#First Mini Project

getwd()
setwd("C://Users//Asus//Desktop//FirstMiniProject")


## Problem 1 ##

pollutantmean <- function(specdata, pollutant, id = 1:332){ #Creates a function named 'pollutantmean'; 'specdata' is the directory that indicates the location of the files; 'pollutant' is a character vector that indicates the name of the pollutant; 'id' is an integer vector that indicates the monitor ID numbers to be used.
  
  files <-list.files(specdata, full.names = TRUE)           #created a list of files and store it to the variable 'files'. In this way, I can access each files on the directory named 'specdata' and the directory path is attach to the file names to give a relative file path.
  
  frame <- data.frame()                                     #Creates an empty data frame and stores it to variable 'frame'.
  
  for(i in id){
    info <- read.csv(files[i])                              # for lines 15-18: Creates a loop that will read each file located at the directory and store it at the temporary bin/variable called 'info'
    frame <- rbind(frame, info)                               #each file information will be added to the empty data frame called 'frame'. Since, we created an empty data frame outside the loop, each information will be saved.
  }
  
  mean_variable <- mean(frame[,pollutant], na.rm = TRUE)    #Get the mean of the column pollutant and remove/ignore any NA values found on the column under pollutant (either nitrate or sulfate).
  
  print(mean_variable)                                      #Prints the results of the mean_variable.
  
} 

pollutantmean("specdata", "nitrate", 23)                    #sample code on how to run the function.


## - End of Problem 1 - ##



## Problem 2 ##

complete <- function(specdata, id = 1:332) {
  files <- list.files(specdata, full.names = TRUE)
  frame <- data.frame()
  
  for (i in id) {
    id <- read.csv(files[i])                         #For lines 39-44: It creates a loop that will read each csv files, counts the number of complete cases, and save each id results on a data frame called 'frame'.
    nobs <- sum(complete.cases(id))                  #complete.cases is a logical vector that identifies each sequence of rows in 'id' if complete. 'Sum' function will count the number of 'TRUE' values. This looping process will be store on the variable 'nobs'.
    temp_frame <- data.frame(i, nobs)                #Creates a temporary data frame that will combine the monitor ID (i) and number of complete cases (nobs).
    frame <- rbind(frame, temp_frame)                #Using rbind, combine the rows of the two data frames (empty and temporary data frame) and store to variable frame. Since, I create an empty data frame outside the loop, each individual information in each ID's will be saved.
  }
  
  colnames(frame) <- c("id", "nobs")                 #Assigned id and nobs as a column name to the data frame called 'frame'.
  
  print(frame)                                       #prints the results of the data frame named 'frame'.
}

complete("specdata", 30:25)                          #sample code on how to run the function


## - End of Problem 2 - ##



## Problem 3 ##

corr <- function(specdata, threshold = 0) {
  
  files <- list.files(specdata, full.names = TRUE)
  
  results <- vector(mode = "numeric", length = 0)                 #Creates a an empty numeric vector and stores to the variable 'results'
  
  for(i in 1:length(files)) {                                     #Creates a loop from 1 to the length of files (332)
    info <- read.csv(files[i])                                    #Read each file located at the directory and store it at the temporary bin/variable called 'info'
    tmp <- complete.cases(info)                                   #Determine the rows in info in which NA value/s is/are not found and stores it at the temporary bin/variable named 'tmp'
    info <- info[tmp, ]                                           #Calls all rows in info in which NA values are not found and stores it to the updated data frame named 'info'
    if (nrow(info) > threshold) {                                 #Conditional statement in which number of rows in info must be greater than 0.
      
      correlation <- cor(info[["sulfate"]], info[["nitrate"]])    #Gets the correlation of the column sulfate and the column nitrate.
      results <- append(results, correlation)                     #I used append to merge the vectors (results and correlation)
      
    }
  }
  
  results                                                         #It supposedly prints the results in function corr. However, It is convenient to hide the result. 
}

cr <- corr("specdata", 5000)                                      #Line 81 to 82: Sample code on how to run the function
head(cr); summary(cr) ; length(cr)


## - End of Problem 3 - ##



## Problem 4 ##

getwd()
setwd("C://Users//Asus//Desktop//FirstMiniProject//Hospital")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11],
     main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack",
     xlab = "Deaths",
     col = "lightblue")


## - End of Problem 4 - ##