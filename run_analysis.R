
#######################################################################
#  STEP 1 Merges the training and the test sets to create one data set.
#######################################################################

#preparing test data

#read test data
test_data_raw<-read.table("UCI HAR Dataset/test/X_test.txt")

#read test subjects data
test_subjects_raw<-read.table("UCI HAR Dataset/test/subject_test.txt")

#read test activity data
test_activities_raw<-read.table("UCI HAR Dataset/test/y_test.txt")

#merge all test
test_raw<-cbind(test_subjects_raw,test_activities_raw,test_data_raw)


#preparing training data

#read train data
train_data_raw<-read.table("UCI HAR Dataset/train/X_train.txt")

#read train subjects data
train_subjects_raw<-read.table("UCI HAR Dataset/train/subject_train.txt")

#read train activity data
train_activities_raw<-read.table("UCI HAR Dataset/train/y_train.txt")

#merge all train
train_raw<-cbind(train_subjects_raw,train_activities_raw,train_data_raw)


#Merge test and training
merged_raw<-rbind(test_raw,train_raw)


#################################################################################################
#  STEP 2 Extracts only the measurements on the mean and standard deviation for each measurement.
#################################################################################################

# Getting Measurements names
measures_names<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

#Adding Subject and Activity to column names
column_names<-c("Subject","Activity",measures_names$V2)

# Properly name columns of merged data
colnames(merged_raw)<-column_names

# Get columns for Subject, Activity, mean() and std()
significant_cols<-c(1,2,grep("mean()",colnames(merged_raw),fixed = TRUE),grep("std()",colnames(merged_raw),fixed = TRUE))

#filter merged dataset with only needed columns
merged_filtered<-merged_raw[,significant_cols]


#################################################################################
#  STEP 3 Uses descriptive activity names to name the activities in the data set.
#################################################################################

#load Activities table Lookup
LU_activities<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
colnames(LU_activities)<-c("Activity","Activity_Name")

#Merge Activities names in merged data set without changing order
merged_named<-merge(merged_filtered,LU_activities,sort = FALSE)


############################################################################
#  STEP 4 Appropriately labels the data set with descriptive variable names.
############################################################################

#This step has been already achieved through previous steps.
#colnames(merged_raw)<-column_names gave name to all measures
#significant_cols<-c("Subject","Activity",grep("mean()",colnames(merged_raw),fixed = TRUE),grep("std()",colnames(merged_raw),fixed = TRUE)) gave name to added columns
#colnames(LU_activities)<-c("Activity","Activity_Name") gave name to Activities_name column

#Using this section for reordering columns for setting first columns for dimensions and next columns for variables and removing activity ID
result1<-merged_named[,c(2,69,3:68)]

########################################################################################################################################################
#  STEP 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
########################################################################################################################################################

#Moving variables column names as dimension for aggregating.
library(reshape2)
merged_dimensioned<-melt(result1,id.vars = c(1:2))

#result2 comes from aggregating the average value for each subject, Activity and measure and reshape if for creating one column per each variable. 
result2<-dcast(merged_dimensioned,Subject + Activity_Name ~ variable,mean)

#output result
write.table(result2,file="Result.txt",row.names = FALSE)
print(result)
result










