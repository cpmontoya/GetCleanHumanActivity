if(!file.exists("UCI Har Dataset")){
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip",method="curl")
     unzip("Dataset.zip")
     if(file.exists("Dataset.zip")) file.remove("Dataset.zip")
} else {
     print("Data is already downloaded and unzipped")
}
testdata<-read.table("UCI HAR Dataset/test/x_test.txt")
traindata<-read.table("UCI HAR Dataset/train/x_train.txt")
features<-read.table("UCI HAR Dataset/features.txt")
names(testdata)<-features[[2]]
names(traindata)<-features[[2]]
testsubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
trainsubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
testactive<-read.table("UCI HAR Dataset/test/y_test.txt")
trainactive<-read.table("UCI HAR Dataset/train/y_train.txt")
testdata<-cbind(testsubjects,testactive,testdata)
traindata<-cbind(trainsubjects,trainactive,traindata)
totaldata<-rbind(traindata,testdata)
names(totaldata)[1]<-"subjects"
names(totaldata)[2]<-"activity"
totaldata<-totaldata[,c(1,2,2+grep("mean[(]|std[(]",features[[2]]))]
names(totaldata)<-sub("[(][)]","",names(totaldata))
names(totaldata)<-gsub("-","_",names(totaldata))
