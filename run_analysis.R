library(stats)
library(dplyr)

## Check if pro director exist
## Create the directory if it does not already exist
## Set the working directory to the newly created dir
## create conn variable to store the url
## download the file and store it locally as UCI.zip




if(!file.exists("./pro")){dir.create("./pro")}

setwd("./pro")

con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

print("Attempting to download a 59MB file..")
if(!file.exists("uci.zip"))
{
  download.file(con,"uci.zip",mode = "wb",cacheOK = TRUE)
}

## check and print if the file was downloaded. 

if (file.exists("uci.zip")){ print("file is available") }

## Unzip the file 

print("unzipping the downloaded file")

unzip(zipfile = "uci.zip",overwrite = TRUE)

## set the working directory to the training folder 

setwd("./UCI HAR Dataset/test")

## set a variable as a widths delimiter to read the fixed width txt file as a dataset

wid<-rep(16,561)

## create a data frame to read the text file which has test data set

print("reading data file.. typically takes some time")

teds <- read.fwf(file = "X_test.txt", widths = wid,header = FALSE)

## create a dataframe to read the activity code for each of the observation

tedsy <- read.fwf(file = "y_test.txt",widths = 2, header = FALSE)

## create a data frame to read the text file which has subject's id
tedsub <- read.fwf(file = "subject_test.txt", widths = 2, header = FALSE)


## insert a column in test data frame to include activity code
teds$actcode<-tedsy$V1

## insert a column to identify the row with subject id / participant
teds$participant<-tedsub$V1

## Move to parent directory
setwd('..')

getwd()

print("Another big file to read.. ")

## Read the text file which has training data set
trds <- read.fwf(file = "./train/X_train.txt", widths = wid,header = FALSE)

## Read the text file which has training data set activity code
trdsy <- read.fwf(file = "./train/y_train.txt",widths = 2, header = FALSE)

## Read the text file which has training subject / participant code
trdsub <- read.fwf(file = "./train/subject_train.txt",widths = 2, header = FALSE)

## append training activity labels and participants with training data set
trds$actcode <- trdsy$V1
trds$particpant <- trdsub$V1



## Features table has the name of all the columns. Ingest the column names of the 561 features available in features.txt

feat<-read.table(file = 'features.txt',header = FALSE, sep = ' ',stringsAsFactors = FALSE)

## assigning column names to train data set for the first 561 features
colnames(trds)<-feat[[2]]

## assigning column names for the activity code and subject code 
colnames(trds)[562]<-as.character("activitycode")
colnames(trds)[563]<-as.character("subjectcode")


## assigning column names to test data set for the first 561 features
colnames(teds)<-feat[[2]]

## assigning column names for the activity code and subject code 
colnames(teds)[562]<-as.character("activitycode")
colnames(teds)[563]<-as.character("subjectcode")

## vertically merge the two datasets resulting in a new data set

comb <- rbind.data.frame(trds,teds)

print("Merged the datafiles successfully")
## Using grep find all the column names which has either a 'mean' or 'std' in the column names. Create a new dataset only with this 
## Using [^F] to avoid pulling the meanFreq variables which are present in the dataset

comb1 <- comb[,grep("mean[^F]|std",colnames(comb))]

## add activity code and subject code to the shortened table

comb1$activitycode<-as.factor(comb$activitycode)

comb1$subjectcode<-as.factor(comb$subjectcode)

print("Removed non-mean, non-std data columns")
## reading activity description from activity_labels file

actlabel<-read.table(file = "activity_labels.txt", header = FALSE, sep = " ",col.names = c("activitycode","activitydescription"))

## merging activity lables with combined data set by id to get activity description
comb1<-merge(x = comb1,y = actlabel,by.x = "activitycode",by.y = "activitycode",all = TRUE)

## We have a data set which is merged, has activity description, has descriptive data values and has only Mean and SD variables
print("We have added descriptity activity to dataset")

##creating a independent tidy data set with the average of each variable for each activity and each subject.

newd<-aggregate(x = comb1[2:67],by = comb1[c("activitydescription","subjectcode")], FUN = mean)

print("Created a new tiday dataset")
## creating descriptive names for columns
## replacing Acc with Acceleration
colnames(newd)<-gsub(pattern = "Acc",replacement = "Acceleration",x = colnames(newd))

## replacing Mag with tbody and tgravity with Time series Body
colnames(newd)<-gsub(pattern = "tBody",replacement = "Time Series Body",x = colnames(newd))

colnames(newd)<-gsub(pattern = "tGravity",replacement = "Time Series Gravity",x = colnames(newd))

colnames(newd)<-gsub(pattern = "fBody",replacement = "Frequency Series Body",x = colnames(newd))

colnames(newd)<-gsub(pattern = "BodyBody",replacement = "Body ",x = colnames(newd))
 
colnames(newd)<-gsub(pattern = "BodyGyro",replacement = "Body Gyro",x = colnames(newd))

colnames(newd)<-gsub(pattern = "BodyAcceleration",replacement = "Body Acceleration",x = colnames(newd))

# write the content of Output file in OutputDataset.csv
write.table(x = newd,file = "OutputDataset.txt",row.names = FALSE)
write.csv(x = newd, file = "OutputDataset.csv",row.names = FALSE)

View(newd)
