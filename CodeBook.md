# Getting and Cleaning Data Assignment Code Book
This code book is divided in tow different sections:

- run_analysis.R script functionality description

- Result.txt file description


## run_analysis.R

This script will perform next steps for the analysis

### Merges the training and the test sets to create one data set

The script reads all neede files from test directory (data, subjects and activities) and merges all in a single data frame using cbind.
It repeats the same with training data creating another data frame. Both data frames are merged together using rbind

test_data_raw: Used for reading X_test.txt data

test_subjects_raw: Used for reading subject_test.txt data

test_activities_raw: Used for reading y_test.txt data

test_raw: Used for appending all columns from test datasets in one single dataset


train_data_raw: Used for reading X_train.txt data

train_subjects_raw: Used for reading subject_train.txt

train_activities_raw: Used for reading y_train.txt

train_raw: Used for appending all columns from train datasets in one single dataset

merged_raw: Creates the union of test and training datasets


### Extracts only the measurements on the mean and standard deviation for each measurement.

Based on features.txt file the script adds column names to all measures in previous delivered data frame and renames columns for subject and Activity. Applying grep function, a new data frame with Subject, activity and only these measurtes that ends with mean() or std() is created (based on features_info.txt that states that measures that contain mean() relate to the mean of the measurement and same for std() ).

measures_names: Used for reading variable names from features.txt

column_names: Array containing all names for the fields in the desired dataset

significant_cols: subset of the variables names that refer to mean or std

merged_filtered: subset of merged_raw with only significant columns for the analysis

### Uses descriptive activity names to name the activities in the data set.
Reading data from activity_labels.txt and using merge function will allow to create a new data frame that contains not only the ID of the activity but also the name of the activity per each record.

LU_activities: Used for reading variable names from activity_labels.txt

merged_named: Used for adding to the analysis dataset the descriptive value of the activities

### Appropriately labels the data set with descriptive variable names.
Based on the result of previous steps, the script has created a data frame with descriptive values for all measurements and activities. The only step performed is to reorder the columns for showing dimensions first and remove activity ID, that does not add any value since Activity Name is already present.

result1: Result of removing unneccesary variables form the analysis dataset

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script uses melt function for converting all measures to dimensions in the data frame. As result of it it creates a new data frame with Subject, Activity name and teh values for all variables included in the analysis.
Applying an aggregation, the script achieves the creation of result data frame that contains the mean for each subject, activity and measure. The sesult will be written in Result.txt file.

merged_dimensioned: Used for moving variables column names as dimension for aggregating.

result2: Comes from aggregating the average value for each subject, Activity and measure and reshape if for creating one column per each variable. 

## Result.txt

This file contain next fields:

- Subject (integer)

Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- Activity_Name (character)

Name of the activity that is performed for each window sample. Its value can be : "LAYING" "SITTING" "STANDING" "WALKING" "WALKING_DOWNSTAIRS" and "WALKING_UPSTAIRS"

Rest of fields refer to numeric values for the variables to analyze.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

- tBodyAcc-mean()-X (numeric)

- tBodyAcc-mean()-Y (numeric)

- tBodyAcc-mean()-Z (numeric)

- tGravityAcc-mean()-X (numeric)

- tGravityAcc-mean()-Y (numeric)

- tGravityAcc-mean()-Z (numeric)

- tBodyAccJerk-mean()-X (numeric)

- tBodyAccJerk-mean()-Y (numeric)

- tBodyAccJerk-mean()-Z (numeric)

- tBodyGyro-mean()-X (numeric)

- tBodyGyro-mean()-Y (numeric)

- tBodyGyro-mean()-Z (numeric)

- tBodyGyroJerk-mean()-X (numeric)

- tBodyGyroJerk-mean()-Y (numeric)

- tBodyGyroJerk-mean()-Z (numeric)

- tBodyAccMag-mean() (numeric)

- tGravityAccMag-mean() (numeric)

- tBodyAccJerkMag-mean() (numeric)

- tBodyGyroMag-mean() (numeric)

- tBodyGyroJerkMag-mean() (numeric)

- fBodyAcc-mean()-X (numeric)

- fBodyAcc-mean()-Y (numeric)

- fBodyAcc-mean()-Z (numeric)

- fBodyAccJerk-mean()-X (numeric)

- fBodyAccJerk-mean()-Y (numeric)

- fBodyAccJerk-mean()-Z (numeric)

- fBodyGyro-mean()-X (numeric)

- fBodyGyro-mean()-Y (numeric)

- fBodyGyro-mean()-Z (numeric)

- fBodyAccMag-mean() (numeric)

- fBodyBodyAccJerkMag-mean() (numeric)

- fBodyBodyGyroMag-mean() (numeric)

- fBodyBodyGyroJerkMag-mean() (numeric)

- tBodyAcc-std()-X (numeric)

- tBodyAcc-std()-Y (numeric)

- tBodyAcc-std()-Z (numeric)

- tGravityAcc-std()-X (numeric)

- tGravityAcc-std()-Y (numeric)

- tGravityAcc-std()-Z (numeric)

- tBodyAccJerk-std()-X (numeric)

- tBodyAccJerk-std()-Y (numeric)

- tBodyAccJerk-std()-Z (numeric)

- tBodyGyro-std()-X (numeric)

- tBodyGyro-std()-Y (numeric)

- tBodyGyro-std()-Z (numeric)

- tBodyGyroJerk-std()-X (numeric)

- tBodyGyroJerk-std()-Y (numeric)

- tBodyGyroJerk-std()-Z (numeric)

- tBodyAccMag-std() (numeric)

- tGravityAccMag-std() (numeric)

- tBodyAccJerkMag-std() (numeric)

- tBodyGyroMag-std() (numeric)

- tBodyGyroJerkMag-std() (numeric)

- fBodyAcc-std()-X (numeric)

- fBodyAcc-std()-Y (numeric)

- fBodyAcc-std()-Z (numeric)

- fBodyAccJerk-std()-X (numeric)

- fBodyAccJerk-std()-Y (numeric)

- fBodyAccJerk-std()-Z (numeric)

- fBodyGyro-std()-X (numeric)

- fBodyGyro-std()-Y (numeric)

- fBodyGyro-std()-Z (numeric)

- fBodyAccMag-std() (numeric)

- fBodyBodyAccJerkMag-std() (numeric)

- fBodyBodyGyroMag-std() (numeric)

- fBodyBodyGyroJerkMag-std()(numeric)
