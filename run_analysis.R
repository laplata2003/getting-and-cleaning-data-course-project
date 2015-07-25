
# Loads required libraries
library(reshape2)
library(stringr)
library(plyr)
library(dplyr)
library(tidyr)

# Reads feature labeles
features <- read.table('features.txt', col.names=c('id', 'feature_name'))

# Reads activity labels
activities <- read.table('activity_labels.txt', col.names=c('id', 'activity_name'))

# Reads test measurements
measurementsTest <- read.table("test/X_test.txt")

# Reads train measurements
measurementsTrain <- read.table("train/X_train.txt")

# Reads test activity IDs
activityIdsTest <- read.table('test/y_test.txt', header=FALSE)

# Reads train activity IDs
activityIdsTrain <- read.table('train/y_train.txt', header=FALSE)

# Reads test subject IDs
subjectIdsTest <- read.csv('test/subject_test.txt', header = FALSE)

# Reads test subject IDs
subjectIdsTrain <- read.csv('train/subject_train.txt', header = FALSE)

# Joins each group (test and train) of measurements, activity IDs and subject IDs in one data frame
completMeasurementsTest <- cbind(subjectIdsTest, activityIdsTest, measurementsTest)
completMeasurementsTrain <- cbind(subjectIdsTrain, activityIdsTrain, measurementsTrain)

# Joins all measurements together in one data framw
measurements <- rbind(completMeasurementsTest, completMeasurementsTrain) 

# Complete column names in measurements. 
# Makes fixes on feature names due make.names() invalid character convertion. 
# Converts contractions in full names in order to improve readability.
featureNames <- make.names(as.character(features$feature_name), unique = TRUE)

featureNames <- str_replace_all(featureNames, "[.][.]", "")
featureNames <- str_replace_all(featureNames, "[.]", "_")
featureNames <- str_replace_all(featureNames, "BodyBody", "Body")
featureNames <- str_replace_all(featureNames, "mean", "mean_")
featureNames <- str_replace_all(featureNames, "tBody", "Time_Body_")
featureNames <- str_replace_all(featureNames, "fBody", "FFT_Body_")
featureNames <- str_replace_all(featureNames, "tGravity", "Time_Gravity_")
featureNames <- str_replace_all(featureNames, "fGravity", "FFT_Gravity_")
featureNames <- str_replace_all(featureNames, "Acc", "_Accelerator_")
featureNames <- str_replace_all(featureNames, "Gyro", "_Gyroscope_")
featureNames <- str_replace_all(featureNames, "Mag", "_Magnitude_")
featureNames <- str_replace_all(featureNames, "^angle.", "Angle_")
featureNames <- str_replace_all(featureNames, "JerkMean", "_Jerk_mean_")
featureNames <- str_replace_all(featureNames, "gravityMean", "Jerk_Mean_gravity_mean_")
featureNames <- str_replace_all(featureNames, "[_][_]", "_")
featureNames <- str_replace_all(featureNames, "_$", "")
colnames(measurements)<- c('subject_id', 'activity_id', featureNames)

# Merge measurements with activities in order to hava a column with descriptive activity names
measurementsWithActivities <- merge(x = activities, y = measurements, by.x = "id", by.y = "activity_id")

# Selects only standard deviation and mean measurementes
stdAndMeanMeasurements <- select(measurementsWithActivities, activity_name, subject_id, contains('std'), contains('mean'))

# Melt and cast measurments in order to calculate means of each measurment grouped by activity and subject
stdAndMeanMeasurements.wide <- melt(stdAndMeanMeasurements, id.vars = c('activity_name', 'subject_id'))
byActivityAndSubjectMeasumentMeans <- dcast(stdAndMeanMeasurements.wide, activity_name + subject_id ~ variable, mean)

# Write tidy file
write.table(byActivityAndSubjectMeasumentMeans, "TidyDataSet.txt", row.names=FALSE)
