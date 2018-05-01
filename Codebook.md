# Codebook file

Codebook file - for the "Getting and Cleaning Data (Final Project)"

## Project details

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 
* a tidy data set as described below
* a link to a Github repository with your script for performing the analysis
  * a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md
  * a README.md file 
  * the file run_analysis.R with all the data manipulation necessary for the project

About the repo: This repo explains how all of the scripts work and how they are connected.One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following: 
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About the data

The following files are included in the dataset:
* 'README.txt';
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## Step 1 - Merge the training and the test sets in order to create a data set

Read the features and recover features names: "feature.txt" : file contains a list of all features, the data is described by 561 observations of two variable: *features_Id* and *features_Names*

Read activities file, it contains 6 observations of two variables: *activity_Id* and *activity_Name*

Read the subject conducting the experiment:
* subject_train contains 7352 observations of one variable (*subject_Id*)
* subject_test contains 2947 observations of one variable (*subject_Id*)

Read training data
* x_train contains 7352 observations of 561 variables (*feature_Name*)
* y_train contains 7352 observations of one variable (*activity_Id*)

Read thetesting data and merge it
* xtest contains 2947 observations of 561 variables (*feature_Name*)
* ytest contains 2947 observations of one variable (*activity_Id*)

Merge the train data and test data, respectively

Merge test and train data

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement

Use of the **grepl** function to select the measurements on the mean and standard deviation (add equally *subject_Id* and *activity_Id*, necessary for further manipulations)

Use of the **mergedata** function to extract the data

## Step 3 - Uses descriptive activity names to name the activities in the data set

Uses the plyr library to use the descriptive activity names 

## Step 4 - Appropriately labels the data set with descriptive variable names

In order to give appropriate names to the variables names, the features_info.txt file
contain the necessary information. Use of the **gsub** function to rename the variables names.

## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Use of the **ddply** function to create the tidy data by considering the *subject_Id* and *activity_Id* variables.

Write the table with **write.table** function, considering raw.names = FALSE

