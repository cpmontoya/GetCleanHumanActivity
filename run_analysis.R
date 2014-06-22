## This Script creates a tidy data from human activity data at the UCI Machine Learning Repository
## Download and unzip the data

if(!file.exists("UCI Har Dataset")){
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip",method="curl")
     unzip("Dataset.zip")
     if(file.exists("Dataset.zip")) file.remove("Dataset.zip")
} else {
     print("Data is already downloaded and unzipped")
}
## pull in the test and training data sets
testdata<-read.table("UCI HAR Dataset/test/x_test.txt")
traindata<-read.table("UCI HAR Dataset/train/x_train.txt")
## get the data variable names
features<-read.table("UCI HAR Dataset/features.txt")
names(testdata)<-features[[2]]
names(traindata)<-features[[2]]
## Get the list of subjects 
testsubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
trainsubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
## get activities performed
testactive<-read.table("UCI HAR Dataset/test/y_test.txt")
trainactive<-read.table("UCI HAR Dataset/train/y_train.txt")
## put it all together in one dataset
testdata<-cbind(testsubjects,testactive,testdata)
traindata<-cbind(trainsubjects,trainactive,traindata)
totaldata<-rbind(traindata,testdata)
## Clean up names of variables and activities and remove unneeded variables
names(totaldata)[1]<-"subjects"
names(totaldata)[2]<-"activity"
totaldata<-totaldata[,c(1,2,2+grep("mean[(]|std[(]",features[[2]]))]
names(totaldata)<-sub("[(][)]","",names(totaldata))
names(totaldata)<-gsub("-","_",names(totaldata))
activities<-read.table("UCI HAR Dataset/activity_labels.txt")
totaldata$activity<-activities[totaldata$activity,]$V2
## Create  and write tidy dataset of means for the different variables
tidydata<-aggregate(totaldata[,-(1:2)],totaldata[,1:2],mean)
write.table(tidydata,"tidydata.txt",sep="|",row.names=FALSE)
