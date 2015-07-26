# Getting and Cleaning Data - Course Project 

The main outcome of this project is the tidy dataset defined in the point (5) of the project. Such data is stored in the file: 

[TidyDataSet.txt](./TidyDataSet.txt)

In order to read this file, it can be done with the following code snipet (running in the same directory):
	
	read.table("TidyDataSet.txt", header=TRUE)

## Code Book

The specific details of variables in the tidy data set are described in the file [codebook.md](./codebook.md).

## How run_analysis.R works

The source data and working directory shall be "UCI Har Dataset". [run_analysis.R](./run_analysis.R) takes source data from it, imports it into R, process it and transforms it into a tidy data subset. It process the data from the specified dataset directory, and produces a tidy dataset, executing the following steps:

 1) Load activity labels (from activity_labels.txt).
 
 2) Load feature labels (from features.txt).
 
 3) For each train & test cases:
 
 	- Load measurements (from X_train.txt / X_test.txt).
 	 
 	- Load activity IDs (from y_train.txt / y_test.txt).
 	 
 	- Load subject IDs (from subject_train.txt / subject_test.txt).
 	
 4) Merge each group (test & train) of measurements, activity IDs and subject IDs in one combined data frame.

 5) Merge (rbind) both combined data frame in one resulting data frame.
 
 6) Assign variable names (from point 2) to the final data frame, in order to improve readability.
 
 7) Merge the data frame with activity labels (form point 1) in order to have a data frame with descriptive activity names.
 
 8) Select 'mean' and 'std' variables fron data frame.
 
 9) Melt the data frame to long form, applying the mean function on every obvservation.
 
10) Write output file



