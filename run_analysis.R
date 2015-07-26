
# Loads required libraries
if("reshape2" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape2")};library(reshape2)
if("stringr" %in% rownames(installed.packages()) == FALSE) {install.packages("stringr")};library(stringr)
if("plyr" %in% rownames(installed.packages()) == FALSE) {install.packages("plyr")};library(plyr)
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr)
if("tidyr" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyr")};library(tidyr)

#library(reshape2)
#library(stringr)
#library(plyr)
#library(dplyr)
#library(tidyr)

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
# Converts names in order to improve readability.
featureNames <- features$feature_name

featureNames <- gsub("\\(\\)", "", featureNames)
featureNames <- gsub("Acc", "-acceleration", featureNames)
featureNames <- gsub("Mag", "-Magnitude", featureNames)
featureNames <- gsub("^t(.*)$", "time-\\1", featureNames)
featureNames <- gsub("^f(.*)$", "frequency-\\1", featureNames)
featureNames <- gsub("(Jerk|Gyro)", "-\\1", featureNames)
featureNames <- gsub("BodyBody", "Body", featureNames)
featureNames <- tolower(featureNames)

colnames(measurements)<- c('subject_id', 'activity_id', featureNames)

# Merge measurements with activities in order to hava a column with descriptive activity names
measurementsWithActivities <- merge(x = activities, y = measurements, by.x = "id", by.y = "activity_id")

# Selects only standard deviation and mean measurementes
stdAndMeanMeasurements <- select(measurementsWithActivities, activity_name, subject_id, contains('std'), 
                                 contains('mean'), -contains('meanFreq'), -contains('angle'))

# Melt in order to transform measurement columns into rows
stdAndMeanMeasurements.wide <- melt(stdAndMeanMeasurements, id.vars = c('activity_name', 'subject_id'))

# Group by activity and subject
byActivityAndSubjectMeasumentGroup <- group_by(stdAndMeanMeasurements.wide, activity_name, subject_id, variable)

# Calculate means of each measurment grouped by activity and subject
byActivityAndSubjectMeasumentGroupMeans <- summarise(byActivityAndSubjectMeasumentGroup, mean = mean(value))

# Write tidy file
write.table(byActivityAndSubjectMeasumentGroupMeans, "TidyDataSet.txt", row.names=FALSE)
