if(!file.exists("UCI Har Dataset")){
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip",method="curl")
     unzip("Dataset.zip")
     if(file.exists("Dataset.zip")) file.remove("Dataset.zip")
} else {
     print("Data is already downloaded and unzipped")
}