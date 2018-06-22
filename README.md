# Getting and Cleaning Data Assignment
In this repository you will find run_analysis.R script. This script will take the content of UCI HAR Dataset directory (the result of downloading https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip file and uncompress it) and will deliver a tidy dataset with the average values for each subject, activity and measure requested by the assignment.
As prerequisites for working, used R must have access to reshape2 package, UCI HAR Dataset directoryr must have downloaded content inside and the script must be copied and executet at the same directory as UCI HAR Dataset directory.

This repository will also contain CodeBook.md file.

## run_analysis.R

This script is based on defined steps of the assignement description:

1.- Merges the training and the test sets to create one data set
The script reads all neede files from test directory (data, subjects and activities) and merges all in a single data frame using cbind.
It repeats the same with training data creating another data frame. Both data frames are merged together using rbind

2.- Extracts only the measurements on the mean and standard deviation for each measurement.
Based on features.txt file the script adds column names to all measures in previous delivered data frame and renames columns for subject and Activity. Applying grep function, a new data frame with Subject, activity and only these measurtes that ends with mean() or std() is created (based on features_info.txt that states that measures that contain mean() relate to the mean of the measurement and same for std() ).

3.- Uses descriptive activity names to name the activities in the data set.
Reading data from activity_labels.txt and using merge function will allow to create a new data frame that contains not only the ID of the activity but also the name of the activity per each record.

4.- Appropriately labels the data set with descriptive variable names.
Based on the result of previous steps, the script has created a data frame with descriptive values for all measurements and activities. The only step performed is to reorder the columns for showing dimensions first and remove activity ID, that does not add any value since Activity Name is already present.

5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script uses melt function for converting all measures to dimensions in the data frame. As result of it it creates a new data frame with Subject, Activity name, measure name and measure value.
Applying an aggregation, the script achieves the creation of result data frame that contains the mean for each subject, activity and measure.

Finally, result data frame is showed.

## CodeBook.md
This file will contain the code book that describes the variables, the data, and any transformations or work performed to clean up the data.



