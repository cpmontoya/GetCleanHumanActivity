GetCleanHumanActivity
=====================

Create tidy data set of Activity data for Getting and Cleaning Data Coursera Class

The submited script "run_analysis.R" first checks to see if the necessary data folder is already in the working directory. IF not it is then downloaded and unziped into the working directory

The test and training data are then pulled into R from the files in the data folder

The variable names for the datasets columns are also read in as well as the activities and their names

The various datasets are then combined into one dataset and names of variables and are cleaned up and some data not needed for this analysis are removed

The tidy dataset is then created taking the mean of each variable for each combination of subject and activity
