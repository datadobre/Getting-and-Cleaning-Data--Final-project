## The objective of the Project is to a R script called run_analysis.R executing the following operations 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

## Step1 - Merge the training and the test sets in order to create a data set
# According to the file UCI HAR Dataset.names:
# The following files are included in the dataset:
# -'README.txt'; 
# -'features_info.txt': Shows information about the variables used on the feature vector.
# -'features.txt': List of all features.
# -'activity_labels.txt': Links the class labels with their activity name.
# -'train/X_train.txt': Training set.
# -'train/y_train.txt': Training labels.
# -'test/X_test.txt': Test set.
# -'test/y_test.txt': Test labels.

# Read the features and recover features names:
# "feature.txt" file contains a list of all features, the data is described by 561 observations of two variable: features_Id features_Names
features<-read.table("./ProjectData/UCI HAR Dataset/features.txt", header=FALSE)
features_Id<-features[,1]
features_Names<-features[,2]

# read activities file
# it contains 6 observations of two variables: activity_Id and activity_Name
activities<-read.table("./ProjectData/UCI HAR Dataset/activity_labels.txt", header=FALSE,col.names = c("activity_Id","activity_Name"))

# read the subject conducting the experiment:
#subject_train contains 7352 observations of one variable (subject_Id)
#subject_test contains 2947 observations of one variable (subject_Id)
subjecttrain <-read.table("./ProjectData/UCI HAR Dataset/train/subject_train.txt", header=FALSE,col.names="subject_Id")
subjecttest <-read.table("./ProjectData/UCI HAR Dataset/test/subject_test.txt", header=FALSE,col.names="subject_Id")

# read training data
#x_train contains 7352 observations of 561 variables (feature_Name)
#y_train contains 7352 observations of one variable (activity_Id)
xtrain <-read.table("./ProjectData/UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names = features_Names)
ytrain <- read.table("./ProjectData/UCI HAR Dataset/train/y_train.txt", header=FALSE,col.names = "activity_Id")

#read the testing data and merge it
#xtest contains 2947 observations of 561 variables (feature_Name)
#ytest contains 2947 observations of one variable (activity_Id)

xtest<-read.table("./ProjectData/UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names = features_Names)
ytest <- read.table("./ProjectData/UCI HAR Dataset/test/y_test.txt", header=FALSE,col.names = "activity_Id")

#merge the train data and test data, respectively
traindata<-cbind(subjecttrain,ytrain,xtrain)
testdata<-cbind(subjecttest,ytest,xtest)

# merge test and train data
mergedata <- rbind(traindata,testdata)

## Step2 - Extracts only the measurements on the mean and standard deviation for each measurement
operation<-grepl("mean|std|subject_Id|activity_Id",names(mergedata))
extracteddata<-mergedata[,operation]

## Step3 - Uses descriptive activity names to name the activities in the data set
library(plyr)
res_data<- join(extracteddata, activities, by = "activity_Id", match = "first")

# Step4 - Appropriately labels the data set with descriptive variable names
# In order to give appropriate names to the variables names, the features_info.txt file contain the necessary information

names(res_data)<-gsub("Acc","Acceleration",names(res_data))
names(res_data)<-gsub("Mag","Magnitude",names(res_data))
names(res_data)<-gsub("^t","TimeDomain",names(res_data))
names(res_data)<-gsub("^f","FrequencyDomain",names(res_data))
names(res_data)<-gsub("mean","Mean",names(res_data))
names(res_data)<-gsub("std","Std",names(res_data))
names(res_data)<-gsub("Freq","Frequency",names(res_data))
names(res_data)<-gsub("Gyro","Gyroscope",names(res_data))

## Step5 - From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.


final_data<- ddply(res_data, c("subject_Id","activity_Id"), numcolwise(mean))
write.table(final_data,file="tidydata_fproject.txt",row.names = FALSE)