## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)

## Load and combine subject list from both subject_train & subject_test
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_combine <- rename(bind_rows(subject_train,subject_test), subject = V1)

## Load and combine x data from both x_train & x_test
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
x_combine <- bind_rows(x_train,x_test)

## Load activity list
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

## Load y data from both y_train & y_test
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## Combine y_train & y_test and Lookup the description of each activity from the activity list
## Rename the column of combined y data from V2 to activity
y_combine <- rename(left_join(bind_rows(y_train,y_test), activity, by = "V1")[2], activity = V2)   

## Load features list, return only 2nd column
features <- read.table("UCI HAR Dataset/features.txt", colClasses = "character")[2]

## Rename the columns of combined x data using the transpose of the features data 
colnames(x_combine) <- t(features)

## Identifying the required columns: columns with mean() & std()
required <- grep("mean\\(\\)|std\\(\\)", t(features))

## Combine the subject, activity and required mean() & std() data together
tidy_data <- cbind(subject_combine, y_combine, x_combine[required])

## Operations to adjust the names of the combined data
colnames(tidy_data) <- gsub("-","_",names(tidy_data))
colnames(tidy_data) <- gsub("\\(\\)","",names(tidy_data))
colnames(tidy_data) <- gsub("BodyBody","Body",names(tidy_data))

## Create an independent tidy data set with the average of each variable for each activity and each subject
summary <- tidy_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

## Create the required text file: tidy_data.txt
write.table(summary, file = "tidy_data.txt", row.name=FALSE)