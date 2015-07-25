#Getting and Cleaning Data: Course Project
#Due Date: 7/26/2015
#C.Daniels
#
#install/include packages
#install.packages("data.table")
library(data.table)
#install.packages("sqldf")
library(sqldf)
#install.packages("readr")
library(readr)
#install.packages("dplyr")
library (dplyr)
#
#My personal location for this project. If not specified, files and output will be placed 
#in the user's current working directory.
#setwd("C:/Coursera Data Science/Getting and Cleaning Data/CourseProject")

#
#Get data and unzip 
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipLocal <- "./projzip.zip"

if (!file.exists(zipLocal)) {
    download.file(zipURL, zipLocal)
    unzip(zipLocal)
}
#
#Test Only: Print values
testit <- function() {
    prtRowsCols(testAll, "testAll")
    prtRowsCols(trainAll, "trainAll")
    prtRowsCols(allData, "allData")
    prtRowsCols(tidyData, "tidyData")
}
#Test Only: print rows/columns of input data frame 
prtRowsCols <- function(df, dfid) {
    print(paste(dfid, "rows", nrow(df), " Columns: ", ncol(df)))
}

#Merge training and test sets to create one data set.
#read the feature.txt file to get a list of columns names
fdata <-read.table("./UCI HAR Dataset/features.txt")
#create a new column (selCol) that will be TRUE for all column names
#  that have mean or std in the name (exclude column names that include "meanFreq") 
fdata$selCol <- (grepl("mean|std", fdata$V2) & !grepl("meanFreq", fdata$V2))
#
#read the Activity_labels file that maps Activity_Id to Activity Name
actLbls <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("Activity_Id", "Activity"))
#
#Process files from the Test Directory
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = fdata$V2) #read data and map column names
#Extract columns that meet the selection criteria (mean and stddeviation only)
testX1 <- subset(testX, select = fdata$selCol == TRUE ) 
#
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("Activity_Id"))
testY[,2] <- actLbls[testY[,1], 2]  ## Add Activity columns and Map to actLbls file
colnames(testY) <-  c("Activity_Id", "Activity")
testY1 <- testY[,-(1),drop=FALSE] ##remove Activity_ID column
#
testS <- read.table("./UCI HAR Dataset/test/Subject_test.txt", col.names = c("Subject"))
#
#Combine the Test Data
testAll <-cbind( testY1, testS, testX1)
#
#Process files from the Train Directory
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = fdata$V2)
#Extract columns that meet the selection criteria (mean and stddeviation only)
trainX1 <- subset(trainX, select = fdata$selCol == TRUE ) 
#
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("Activity_Id"))
trainY[,2] <- actLbls[trainY[,1], 2]  ## Add column for Activity and Map to actLbls file
colnames(trainY) <-  c("Activity_Id", "Activity")
trainY1 <- trainY[,-(1),drop=FALSE] ##remove Activity_ID column
#
trainS <- read.table("./UCI HAR Dataset/train/Subject_train.txt", col.names = c("Subject"))
#
#Combine the Train Data
trainAll <-cbind(trainY1, trainS, trainX1)
#
#Use rbind to Merge testAll and trainAll into one dataframe.
allData <- rbind(testAll, trainAll)
#
#Create the final tidy data set
tidyData <- allData  %>% group_by( Activity, Subject) %>%summarise_each(funs(mean))
#
#testit #Test only
#Save the tidyDataset to a file
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)
#output names of fields for documentation in the code book 
#cat(names(tidyData),sep="\n")
