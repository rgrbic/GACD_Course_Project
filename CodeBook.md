# CodeBook
Thursday, May 21, 2015  

# Data Set Information (from <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">source</a>)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# Explanation of R script

The R script <code>run_analysis.R</code> perform getting and cleaning of the data in order to obtain final data set. The procedure consists of the two main steps: getting the data and merging/transformation of the data

<br>

#### Getting the data

* Checking whether directory <code>./GACD_data</code> exists; create if necessary.

* Checking whether directory <code>./GACD_data/UCI HAR Dataset</code> exists.

* If <code>./GACD_data/UCI HAR Dataset</code> does not exist, download the dataset and unzip it in <code>./GACD_data</code>.

<br>

#### Merging/transformation of the data

* Read the train and test data using <code>read.table</code> into following data frames: <code>x_train</code>, <code>y_train</code>, <code>subject_train</code>, <code>x_test</code>, <code>y_test</code>, <code>subject_test</code>

* Append test data set to train data set using <code>rbind</code> function which results in data frames: <code>x</code>, <code>y</code>, <code>subject</code>

* Load feature names with <code>read.table</code> and store result in data frame <code>features</code>. Extract only the measurements on the mean and standard deviation for each measurement by subsetting the data frame<code>x</code> according to the result of <code>grep</code> function applied to features data frame. Store result in data frame called <code>x_mean_std</code>.

* Load activity names with <code>read.table</code> and store result in data frame <code>activityLabels</code>. Using <code>cut</code> command, add descriptive activity names to <code>y</code> data frame from <code>activityLabels</code> data frame.

* Bind columns of data frames <code>x_mean_std</code>,  <code>y</code> and  <code>subject</code> using <code>cbind</code> function and store result in data frame <code>data</code>.

* By using dplyr library, the final independent tidy data set is made which contains the average of each variable for each activity and each subject. the data set is stored in data frame <code>dataFinal</code>. The data frame <code>dataFinal</code> is also printed to a dataFinal.txt file using <code>write.table</code> function.

<br>

