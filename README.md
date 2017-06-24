# CleaningDataProj
Repository to store and share deliverable's of Getting and Cleaning Data Course Project

#### RAW DATA folder holds the raw data set downloaded from the URL
#### OUTPUT DATA folder has the final output csv created after tidying data set
#### run_analysis.R holds the actual script of R file which transforms the raw input file to tidy dataset
#### codebook.md has detailed information about the generated data set

### Step By Step explanation of the R Script 
1. Load the libraries

2. Check if pro director exist
*Create the directory if it does not already exist
*Set the working directory to the newly created dir
*create conn variable to store the url
*Download the file and store it locally as UCI.zip

3. Validate if successfully downloaded and unzip the file

4. Set a variable as a widths delimiter to read the fixed width txt file as a dataset
*create a data frame to read the text file which has test data set

5. Create a dataframe to read the activity code and Subject id for test data set
* Insert a column in test data frame to include activity code
* Insert a column to identify the row with subject id / participant

6. Set a variable as a widths delimiter to read the fixed width txt file as a dataset
*create a data frame to read the train file which has test data set

7. Create a dataframe to read the activity code and Subject id for train data set
* Insert a column in test data frame to include activity code
* Insert a column to identify the row with subject id / participant

8. Features table has the name of all the columns. Ingest the column names of the 561 features available in features.txt

9. Assign column names to train data set for the first 561 features, activity code and subject code for test and train data sets

10. Merge vertically  the two datasets resulting in a new data set

11. Find, using grep all the column names which has either a 'mean' or 'std' in the column names. Create a new dataset only with this 

12. Add activity code and subject code to the shortened table

13. Merge activity lables with combined data set by id to get activity description

14. Creating a independent tidy data set with the average of each variable for each activity and each subject by using Aggregate funcion

15. Use a series of substitue functions to make the column names more readable

16. Generate the output in a .csv file

17. View the newly created dataset
