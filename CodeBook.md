###Code Book

This code book describes the variables, the data, and any transformations or work performed to clean up the data


###Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


###Data Source
Full description of dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Dataset for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


###Dataset

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 


###Data Transformation
The raw data is processed with run_analysis.R to produce a tidy data file named tidy_data.txt

1. Merges the training and the test sets to create one data set.
 
   The training and test data for the activity, subject and signals variables are read and combined into a single data set

2. Extracts only the measurements on the mean and standard deviation for each measurement.
 
   Only signals variables with names containing mean value - mean() & standard deviation - std() are extracted and included in the final tidy data file.  

3. Uses descriptive activity names to name the activities in the data set
 
   The activity names could be found in 'activity_labels.txt' and this is mapped to the combined y_train & y_train training labels. The resulting tidy_data.txt file would contain the descriptive activity names instead of the number labels.  

4. Appropriately labels the data set with descriptive variable names.

   The descriptive variable name for the data could be found in 'features.txt' and this is mapped to the combined x_train & x_train signals variables. The abbreviated names are retained as renaming all the abbreviation in full would result in very long column names. The following changes are made to symbols that are not suitable in names and typo errors:
      1. Substitute "-" with "_"
      2. Remove "()"
      3. Correcting type of "BodyBody" to "Body"

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
   



