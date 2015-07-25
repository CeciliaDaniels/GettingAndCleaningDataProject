##Coursera Getting and Cleaning Data - Course Project
README.md
==================================================================
### Author: Cecilia Daniels
###Date: 7/25/22015
==================================================================

###In this project:
Input activity data UCI HAR Data was used to create a subset of Mean and Std Deviation data elements in the test and training data sets. This data set is subsequently used to create a final tidyData set with the average of each variable, for each activity, for each subject.

###Github repo: https://github.com/CeciliaDaniels/GettingAndCleaningDataProject
###Repo Contents:
run_analysis.r: R programming script for reading and processing the UCI HAR Data
README.md: This document
CodeBook.md: Describes the input and output data and the processing steps 

### To run this code in your environment:
* Copy the run_analysis.R script to your working directory.
* Execute the run_analysis.R script
* Data will be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" to ./projzip.zip
* The zip file will be extracted to the subdirectory .\UCI HAR Dataset
* Output will be saved to ./tidyData.txt


###Input Data:
The input data files contain information collected from the accelerometers from the Samsung Galaxy S smart phone. The input data files unzip to a UCI HAR 

Data directory. In this directory you will find a README.txt file that fully describes the input data. 

The the following files - were used in the course project (run_analysis.r):
===========================================================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

License:
========
Use of the input datasets in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 

Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


