#CodeBook 

#Downloading Data

The data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and is unzipped.

It contained data about test, train and some other files which have features, features_info, activity_name, Readme.

#Variables used during the whole process

xt : The test data read from X_test.txt file.

yt : The test activity data read from y_test.txt file.

subt : The test subject data read from subject_test.txt file.

test : Finally the merged data set of all data related to test including measurements, activity and subject.

xn : The train data read from X_train.txt file.

yn : The train activity data read from y_train.txt file.

subn : The train subject data read from subject_train.txt file.

train : Finally the merged data set of all data related to train including measurements, activity and subject.

fea : The label names data read from features.txt file.

cn : A vector containing labels including activity, subject and feature names.

mdata : This data frame is used in steps 1-5 so description stepwise.

Step 1 : The merged data set of train and test data set build using rbind.

Step 4 : The merged data set with appropriate labels.

Step 2 : The data set obtained by extracting columns which are related to mean and standard deviation from the mdata in the previous step.

Step 3 : Data set containing mean and standard deviations and has descriptive activity names.

Step 5 : Data set on which aggregate function is performed.

res : The data set which contains the final result i.e. the mean of each column for each subject and activity.

#Labels of the final dataset

The first column is labelled subject which refers to the subject who performed the task.

The second column is labelled activity i.e. which activity's measurement is this. 

The rest of the columns names contains the mean of the data as explained in features_info.txt and the units are sameas in features.txt.

#Summary of Transformations

We read the data from .txt files, merged them to form one data set. 

Read features and assigned those features to the data set.

Extracted the data which we required.

Assigned a descriptive activity name.

Formed a final data set calculating mean of the column from the data set we have using aggregate().
