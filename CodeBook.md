Data Science Specialization - Getting and Cleaning Data Course Project
======================================================================

##Code book

### Description
This repository contains description of variables considered in Getting and Cleaning Data course project, as part of Coursera Data Science Specialization

### Source Data
Data download from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Set Information (from UCI dataset description)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


#### Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


#### Step 1. Merge the training and the test sets to create one data set.

List of files to merge into a single dataset:

- features.txt
- activity_labels.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt
- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt

Assign column names and merge to create one data set. Merged dataset variable is called *result*.


#### Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 

feature.txt file was analysed in order to find which variables are related to mean and std. deviation observations. Variables that matters to analysis were registered to a new variable called *dataset*. 


#### Section 3. Use descriptive activity names to name the activities in the data set

activity.txt contain the activities labels. Therefore, subset integer activity and replace to the label, creating a new column called *activity*.


#### Section 4. Appropriately label the data set with descriptive activity names.

This step was antecipated before step 2 in order to renaming all column names.


#### Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

Last step creates a *finaldata* dataframe, which is the tidy data. Then dataframe is saved in *tidy_dataset.txt*