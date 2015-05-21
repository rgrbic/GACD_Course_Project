# Getting and Cleaning Data 
# Course project
# 21.05.2015.

# Getting the data
###############################################################################
#clean env
rm(list = ls())

#get the data
if(!is.element("GACD_data",dir())){
    dir.create("./GACD_data")
}
    
if(!is.element("UCI HAR Dataset",dir("./GACD_data"))){
    
    # download data
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile = "./GACD_data/datasetActivity.zip")
    dateDownloaded <- date()
    
    # unzip the data
    unzip("./GACD_data/datasetActivity.zip", exdir = "./GACD_data")
    
}

dataDir <- "./GACD_data/UCI HAR Dataset/"



#Load the data
###############################################################################

# load the train and test data
x_train <- read.table(paste(dataDir, "train/X_train.txt", sep=""))
y_train <- read.table(paste(dataDir, "train/y_train.txt", sep=""))

x_test <- read.table(paste(dataDir, "test/X_test.txt", sep=""))
y_test <- read.table(paste(dataDir, "test/y_test.txt", sep=""))

subject_train <- read.table(paste(dataDir, "train/subject_train.txt", sep=""))
subject_test <- read.table(paste(dataDir, "test/subject_test.txt", sep=""))



# 1
# Merges the training and the test sets to create one data set.
###############################################################################

#use rbind to append test data set to train data set
x <- rbind(x_train,x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

colnames(subject) <- "subject"

#check if there is duplicated rows in x
#if(1){ sum(duplicated(x)) }



# 2
# Extracts only the measurements on the mean and standard deviation for
# each measurement.
###############################################################################

# load feature names
features <- read.table(paste(dataDir,"features.txt", sep=""))

#set column names in x
colnames(x) <- features$V2

#use grep + regular expression to find features with -mean() or -std()
featuresMeanStd <- grep("-(mean|std)\\(\\)", features$V2, ignore.case = T)

#subset only columns that have -mean() or -std()
x_mean_std <- x[,featuresMeanStd]

#check result
str(x_mean_std)



# 3
# Uses descriptive activity names to name the activities in the data set
###############################################################################

#load acitivity labels
activityLabels <- read.table(paste(dataDir,"activity_labels.txt", sep=""))

#instead number 1-6, put labels in y data set
y <- data.frame(activity = cut(y$V1,
                               breaks = seq(from = 0.5, to = 6.5,by = 1),
                               labels = activityLabels$V2))



# 4
# Appropriately labels the data set with descriptive variable names. 
###############################################################################

#combine features and output variable, add subject identifier; use column binding
data <- cbind(x_mean_std, y, subject)


# 5
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject
###############################################################################

#use dplyr library
library(dplyr)

# for each column calculate mean but with respect to activity and subject
dataFinal <- data %>% group_by(activity, subject) %>% summarise_each(funs(mean))

write.table(dataFinal, paste(dataDir, "dataFinal.txt", sep=""), row.name=FALSE)
