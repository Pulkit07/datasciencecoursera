##  Getting and Cleaning Data Course Project
##  Author - Pulkit Goyal

##################################################################################################
##  Step1 :Merging the training and test sets to create one data set.

##  Download the zip file manually and unzip data.
##  Folder stored at : C:\Users\Admin\Downloads\getdata_projectfiles_UCI HAR Dataset

##  Setting working directory
setwd("C:/Users/Admin/Downloads/getdata_projectfiles_UCI HAR Dataset")
##  Checking files
dir()
##  files/folders present: "~$atures_info.txt"  "~$README.txt"  "activity_labels.txt"
##  "features.txt"  "features_info.txt"   "README.txt"  "test"  "train"

##  reading test data and column binding it.
xt<-read.table("test/X_test.txt");
yt<-read.table("test/y_test.txt");
subt<-read.table("test/subject_test.txt");
test<-cbind(subt,yt,xt);

##  reading train data and column binding it.
xn<-read.table("train/X_train.txt");
yn<-read.table("train/y_train.txt");
subn<-read.table("train/subject_train.txt");
train<-cbind(subn,yn,xn);

##  merging test and train data i.e. row binding them.
mdata<-rbind(train,test);


##################################################################################################
## Step 4 :Appropriately labels the data set with descriptive variable names.

##  reading features.txt file
fea<-read.table("features.txt");

##Labeling the data set with variable names from features.txt and subject for subject no. and activity for activity type.
cn<-c("subject","activity",as.character(fea[,2]));
colnames(mdata)<-cn;



###################################################################################################
##  Step 2 :Extracts only the measurements on the mean and standard deviation for each measurement.

##  using grepl to extract columns which are related to mean and standard deviations and reataining activity and subject column.
mdata<-mdata[,grepl("mean|std|activity|subject",colnames(mdata))];


###################################################################################################
##  Step 3 :Uses descriptive activity names to name the activities in the data set.

##  using which() to find indexes and assinging the descriptive activity name according to activity_labels.txt.
mdata$activity[which(mdata$activity==1)]<-'WALKING';
mdata$activity[which(mdata$activity==2)]<-'WALKING_UPSTAIRS';
mdata$activity[which(mdata$activity==3)]<-'WALKING_DOWNSTAIRS';
mdata$activity[which(mdata$activity==4)]<-'SITTING';
mdata$activity[which(mdata$activity==5)]<-'STANDING';
mdata$activity[which(mdata$activity==6)]<-'LAYING';



###################################################################################################
## Step 5 :From the data set in previous step create a new independent tidy data set with the average of each variable for each activity and each subject.

##  using the aggregate function from stats package to calculate mean of each column for each activity and each subject.

##  calculating for first column and hence initialising a data frame with subject and activity.
res<-aggregate(mdata[,3]~mdata$subject+mdata$activity,FUN=mean);
##  printing res to see the result of aggregate function
res

##  we can see that aggregate function produces 180X3 data frame in which third column contains the mean values.
##  using a loop and aggregate function with proper subsetting to add values to res data frame.
for(e in 4:ncol(mdata)){
  res[,e]<-aggregate(mdata[,e]~mdata$subject+mdata$activity,FUN=mean)[,3];
}

##changing column names of res and setting the same as of mdata.
names(res)<-names(mdata);



###################################################################################################
##  Now the data is being created, writing it into a file using write.table from utils package.
write.table(res,"resdata.txt");

##  We can again reload the resdata.txt file to see our data using read.table function.
