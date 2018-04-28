# Getting-and-Cleaning-Data--Final-project


The objective of the Project is to a R script called run_analysis.R executing the
following operations 

## Step1 - Merge the training and the test sets in order to create a data set

The following files are included in the dataset:
* 'README.txt';
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

Read the features and recover features names:
* "feature.txt" file contains a list of all features, the data is described by 561 observations
of two variable: features_Id features_Names

Read activities file, it contains 6 observations of two variables: activity_Id and activity_Name

Read the subject conducting the experiment:
* subject_train, contains 7352 observations of one variable (subject_Id)
* subject_test, contains 2947 observations of one variable (subject_Id)

Read training data
* x_train contains 7352 observations of 561 variables (feature_Name)
* y_train contains 7352 observations of one variable (activity_Id)

Read the testing data and merge it
* xtest, contains 2947 observations of 561 variables (feature_Name)
* ytest, contains 2947 observations of one variable (activity_Id)

Merge the train data and test data, respectively

Merge test and train data

## Step2 - Extracts only the measurements on the mean and standard deviation for each measurement

## Step3 - Uses descriptive activity names to name the activities in the data set

## Step4 - Appropriately labels the data set with descriptive variable names

In order to give appropriate names to the variables names, the features_info.txt file contain the necessary information

## Step5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

