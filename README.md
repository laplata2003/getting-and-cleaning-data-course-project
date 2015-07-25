# Getting and Cleaning Data - Course Project 

The main outcome of this project is the tidy dataset defined in the point (5) of the project. Such data is stored in the file: 

[TidyDataSet.txt](./TidyDataSet.txt)

In order to read this file, it can be done with the following code snipet (running in the same):
	
	read.table("TidyDataSet.txt", header=TRUE)

## Code Book

The specific details of variables in the tidy data set are described in the file [codebook.txt](./codebook.txt).

## How run_analysis.R works

[run_analysis.R](./run_analysis.R) takes source data from the **UCI Har Dataset** directory, imports it into R, and transforms it into a tidy data subset. 

The script performs the following operations to import, clean, and transform the data set. These steps are also indicated in comments throughout the .R file.

1. Read the files from the test and training data and merge the training and test sets to create one data set.
	1. Combine the values from the **subject_test** and **subject_train** files to create a single TestSubject column that identifies the study participant.
	2. Combine the values from the **Y_test** and **Y_train** data to create a single Activity column that indicates that activity class (for instance, walking or sitting).
	3. Combine the values from the **X_test** and **X_train** files to create additional variable columns, one column for each measurement and calculation included in the data set (561 variable columns total, in the initial combined data set; 563 columns including the TestSubject and Activity columns).
	2. Clean up the column names to remove hyphens and parentheses and replace them with periods.
2. Extract only the measurements on the mean and standard deviation for each measurement.
	1. Use the dplyr **select** function to create a subset of the data that only includes columns that have ".mean." and ".std." in their column names.
	2. It's not required for the subset, but at this point the script also converts the test subject and activity columns to factors, to facilitate correct calculations later.
3. Use descriptive activity names to name the activities in the data set. 
	1. Use the **mapvalues** function to map the numeric activity values to descriptive names like "Walking" and "Standing."
2. Appropriately label the data set with descriptive variable names.
	1. Use the **stringr_replace_all** function from the stringr library to do a number of find and replace operations on the column names. The details of the resulting descriptive names are included in [codebook.md](./codebook.md).
2. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	1. Use split/apply/combine logic. First, split the data by the subject and activity factors using the **split** method.
	2. Next, use **lapply** to iterate over each item in the resulting list, and use **apply** to apply the **mean** method to calculate the average of each column. 
	3. The output of lapply is a list, so combine it back to a data frame.
	4. Use **strsplit** to break the subject and activity factors back into separate sets, and use **cbind** to properly bind them as the first columns in the resulting data set. 

## Indications for running run_analysis.R

- The script assumes that the data source files are in the a directory called UCI HAR Dataset that's in the current working directory. It assumes that the directory structure and file names and locations with UCI Har Dataset have not been changed since they were extracted from the source .zip file.
- The references to file locations in [run_analysis.R](./run_analysis.R) are written to work with the Windows file system. You'll need to modify the file paths in the read.table calls to run on Mac/Linux systems.


