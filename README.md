# Getting and Cleaning Data, Course Project
Thursday, May 21, 2015  

## About repository

This repository contains necessary files of course project "Getting and Cleaning Data", hosted on <a href="www.coursera.org">Coursera</a>. The idea of the course project is to obtain and tidy data that can be found <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a>. The data were collected from the accelerometers of Samsung Galaxy S smartphone that was carried by different subject in different conditions. Full description of the available raw data can be found <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here</a>.

## Project course tasks

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## File description

* <code>run_analysis.R</code> - R script that downloads the data, loads the data and performs transformations

* <code>dataFinal.txt</code> - resulting dataset produced by the R script (as required in 5th task)

* <code>CodeBook.md</code> - describes the process of getting and cleaning the data



