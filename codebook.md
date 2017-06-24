# CleaningDataProj Code Book

## Objective
The goal is to prepare tidy data set from a raw dataset downloaded from Internet

## Input Data set
The URL presented below houses the data obtained from a research project on wearable computing

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Input data summary

* Data downloaded from the site is present in the folder Rawdata
* 70% of observations are observed in Training Data Set folder
* 30% of observations are observed in Test Data Set folder
* 6 different activities were tracked during the experimental period
* 30 different subject/participant's data is provided
* Main data set has more than 561 feature vectors captured

## Data Preparatory Steps

* Downloaded the file from URL
* Unzipped the file
* Using read.fwf function read the test data set
* Column appended the subjects for the test data set
* Column appended the activity code for the test data set
* Repeated the 3 above steps for train data set
* Merged the two dataset using Rbind to arrive at combined data set
* Using grep command reduced the data frame to have only mean and std columns 
* Read the activity label file to get activity code description
* Merged the combined data set with activity code file to get activity description
* Create a new data set using aggregate function, classified by Activity and Subject and apply Mean function to get Subject level, activity level mean values of different measures
* Parse the column names to make it readable using substitute text operations
* write the output into a .csv file using write.table command



### Output Data Set
Output of the script is stored in a .csv file named as 'OutputDataset.csv'

The following variables are documented in the Outputdataset

## activitydescription	
  Categorical variable with 6 different values
  *VALUES: WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, SITTING, STANDING,  LAYING*

## subjectcode	
  Factor variable identifiying 30 different values for different participants
  *vALUES: 1 TO 30*
  
## TIME SERIES VARIABLES
*Values range FROM -1 TO 1*
###### Time Series Body Acceleration-mean()-X	
###### Time Series Body Acceleration-mean()-Y	
###### Time Series Body Acceleration-mean()-Z	
###### Time Series Body Acceleration-std()-X	
###### Time Series Body Acceleration-std()-Y	
###### Time Series Body Acceleration-std()-Z	
Time Series GravityAcceleration-mean()-X	
Time Series GravityAcceleration-mean()-Y	
Time Series GravityAcceleration-mean()-Z	
Time Series GravityAcceleration-std()-X	
Time Series GravityAcceleration-std()-Y	
Time Series GravityAcceleration-std()-Z	
Time Series Body AccelerationJerk-mean()-X	
Time Series Body AccelerationJerk-mean()-Y	
Time Series Body AccelerationJerk-mean()-Z	
Time Series Body AccelerationJerk-std()-X	
Time Series Body AccelerationJerk-std()-Y	
Time Series Body AccelerationJerk-std()-Z	
Time Series Body Gyro-mean()-X	
Time Series Body Gyro-mean()-Y	
Time Series Body Gyro-mean()-Z	
Time Series Body Gyro-std()-X	
Time Series Body Gyro-std()-Y	
Time Series Body Gyro-std()-Z	
Time Series Body GyroJerk-mean()-X	
Time Series Body GyroJerk-mean()-Y	
Time Series Body GyroJerk-mean()-Z	
Time Series Body GyroJerk-std()-X	
Time Series Body GyroJerk-std()-Y	
Time Series Body GyroJerk-std()-Z	
Time Series Body Acceleration Magnitude-mean()	
Time Series Body Acceleration Magnitude-std()	
Time Series GravityAcceleration Magnitude-mean()	
Time Series GravityAcceleration Magnitude-std()	
Time Series Body AccelerationJerk Magnitude-mean()	
Time Series Body AccelerationJerk Magnitude-std()	
Time Series Body Gyro Magnitude-mean()	
Time Series Body Gyro Magnitude-std()	
Time Series Body GyroJerk Magnitude-mean()	
Time Series Body GyroJerk Magnitude-std()	

## FREQUENCY SERIES VARIABLES
*vALUES RANGE FROM -1 TO 1*
Frequency Series Body Acceleration-mean()-X	
Frequency Series Body Acceleration-mean()-Y	
Frequency Series Body Acceleration-mean()-Z	
Frequency Series Body Acceleration-std()-X	
Frequency Series Body Acceleration-std()-Y	
Frequency Series Body Acceleration-std()-Z	
Frequency Series Body AccelerationJerk-mean()-X	
Frequency Series Body AccelerationJerk-mean()-Y
Frequency Series Body AccelerationJerk-mean()-Z
Frequency Series Body AccelerationJerk-std()-X
Frequency Series Body AccelerationJerk-std()-Y
Frequency Series Body AccelerationJerk-std()-Z
Frequency Series Body Gyro-mean()-X	
Frequency Series Body Gyro-mean()-Y	
Frequency Series Body Gyro-mean()-Z	
Frequency Series Body Gyro-std()-X	
Frequency Series Body Gyro-std()-Y	
Frequency Series Body Gyro-std()-Z	
Frequency Series Body Acceleration Magnitude-mean()	
Frequency Series Body Acceleration Magnitude-std()	
Frequency Series Body AccelerationJerk Magnitude-mean()
Frequency Series Body AccelerationJerk Magnitude-std()
Frequency Series Body Gyro Magnitude-mean()
Frequency Series Body Gyro Magnitude-std()
Frequency Series Body GyroJerk Magnitude-mean()
Frequency Series Body GyroJerk Magnitude-std()

