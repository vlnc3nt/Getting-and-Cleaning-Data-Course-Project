### Getting & Cleaning Data Course Project

####Project Description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The aim is to create one R script that does the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

You will find in this Repo: 

1.  run_analysis.R : the R script used to produce tidy_data.txt
2.  CodeBook.md : describes the variables, the data, and transformations performed to clean up the data
3.  README.md :  describes how to run run_analysis.R

####Getting Started


#####Data
The data should be downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted to the R Working Directory.


#####R Package
The R Package required for this operation is dplyr.


#####R Script
Place the R script in the R Working Directory and run the code by using source("run_analysis.R"). A new file named tidy_data.txt will be created in the R working directory.

Please refer to run_analysis.R for details on how the code runs and CodeBook.md for details on the variables, the data, and transformation process.
