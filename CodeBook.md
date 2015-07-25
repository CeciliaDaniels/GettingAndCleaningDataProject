##Course Project CodeBook: Getting and Cleaning Data

### Raw Data  

Raw Data was obtained from the UCI HAR data supplied as project input for the Coursera Getting and Cleaning Data Course. It can be accessed using the following link:
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
The README included with the raw data fully describes the input files for the project.

###List of files used from the UCI HAR data: ##
* features.txt
* features_Info.txt
* activity_labels.txt
* \\test\\Subject_test.txt
* \\test\\X_test
* \\test\\Y_test.txt
* \\train\\Subject_train.txt
* \\train\\X_train
* \\train\\Y_train.txt

### Processing:
####There is one script is this repo called run_analysis.R.  The processing steps are described below.  
* Load necessary R packages. If packages are not installed on your system, uncomment install steps in code.
* If input data has not been downloaded, download it automatically and unzip it to .projzip.zip
* Read the feature.txt file to get a list of column names in the X_test and X_train data files
* Identify mean and std columns. Done by creating a new column (selCol) that will be set to TRUE for column names that have "mean" or "std" in the name (and exclude column names that include "meanFreq") 
* Read the Activity_labels file that maps Activity_Id to Activity Name
* For the Test Data
  * Read the data and map column names to match information from feature.txt file
  * Extract the columns that meet the selection criteria
  * Read the Activity Id information. Create a new column and map it to the associated Activity_labels value.  Drop the Activity Id column so only Activity Label column is left.
  * Read the Subject_Test Data	
  * Combine the Columns for Subject, Activity, X_Test (using cbind) to create an output Data frame called testAll
 * For the Training Data
 * Read the data and map column names to match information from feature.txt file
 * Extract the columns that meet the selection criteria
 Read the Activity Id information. Create a new column and map it to the associated Activity_labels value.  Drop the Activity Id column so only Activity Label column is left.
  * Read the Subject Training Data	
  * Combine the Columns for Subject, Activity, X_Train (using cbind) to create an output Data frame called trainAll
  * Use rbind to create a combined data frame called allData
  * Create the tidyData by grouping allData by Activity and Subject and calculatating the mean
  * Write the tidyData output to the file tidyData.txt
  * Note: run analysis.R contains the following inactive code: A testit function that will print rows and columns of intermediate data frames and code to output names of fields in the tidyData set for documentation in the code book 
	


### Tidy Data Element Names and Data Types:
#### Note: All fields except for Activity and Subject are numeric. 
<pre>
Activity (type: factor)
Subject  (type: integer)
tBodyAcc.mean...X 
tBodyAcc.mean...Y 
tBodyAcc.mean...Z
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.mean..
tBodyAccMag.std..
tGravityAccMag.mean..
tGravityAccMag.std..
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std..
tBodyGyroMag.mean..
tBodyGyroMag.std..
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.mean..
fBodyAccMag.std..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.std..
</pre>
