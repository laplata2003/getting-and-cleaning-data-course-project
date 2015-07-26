# Getting and Cleaning Data - Course Project Codebook

## Data dictionary

The [tidy data set file](./TidyDataSet.txt) has observations summarized by pairs of activities and subjects (6 categories of activities and 30 subjects). Tidy data set has the following 4 columns:
- Activity (activity_name) 
- Subeject (subject_id)
- Measuremente (variable)
- Mean (mean)

### Activity
String value with one of the following possibles:
- LAYING
- SITTING
- STANDING
- WALING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

### Subject
Numeric ID between 1 and 30 representing the subject who performed the experiment. 

### Measurement
String vale representing the measurement's name which the mean is calculated for. The possible values are (refer the [original data set code book](./features_info.txt) for further info about these variables):
 - time-body-acceleration-std-z
 - time-gravity-acceleration-std-x
 - time-gravity-acceleration-std-y
 - time-gravity-acceleration-std-z
 - time-body-acceleration-jerk-std-x
 - time-body-acceleration-jerk-std-y
 - time-body-acceleration-jerk-std-z
 - time-body-gyro-std-x
 - time-body-gyro-std-y
 - time-body-gyro-std-z
 - time-body-gyro-jerk-std-x
 - time-body-gyro-jerk-std-y
 - time-body-gyro-jerk-std-z
 - time-body-acceleration-magnitude-std
 - time-gravity-acceleration-magnitude-std
 - time-body-acceleration-jerk-magnitude-std
 - time-body-gyro-magnitude-std
 - time-body-gyro-jerk-magnitude-std
 - frequency-body-acceleration-std-x
 - frequency-body-acceleration-std-y
 - frequency-body-acceleration-std-z
 - frequency-body-acceleration-jerk-std-x
 - frequency-body-acceleration-jerk-std-y
 - frequency-body-acceleration-jerk-std-z
 - frequency-body-gyro-std-x
 - frequency-body-gyro-std-y
 - frequency-body-gyro-std-z
 - frequency-body-acceleration-magnitude-std
 - frequency-body-acceleration-jerk-magnitude-std
 - frequency-body-gyro-magnitude-std
 - frequency-body-gyro-jerk-magnitude-std
 - time-body-acceleration-mean-x
 - time-body-acceleration-mean-y
 - time-body-acceleration-mean-z
 - time-gravity-acceleration-mean-x
 - time-gravity-acceleration-mean-y
 - time-gravity-acceleration-mean-z
 - time-body-acceleration-jerk-mean-x
 - time-body-acceleration-jerk-mean-y
 - time-body-acceleration-jerk-mean-z
 - time-body-gyro-mean-x
 - time-body-gyro-mean-y
 - time-body-gyro-mean-z
 - time-body-gyro-jerk-mean-x
 - time-body-gyro-jerk-mean-y
 - time-body-gyro-jerk-mean-z
 - time-body-acceleration-magnitude-mean
 - time-gravity-acceleration-magnitude-mean
 - time-body-acceleration-jerk-magnitude-mean
 - time-body-gyro-magnitude-mean
 - time-body-gyro-jerk-magnitude-mean
 - frequency-body-acceleration-mean-x
 - frequency-body-acceleration-mean-y
 - frequency-body-acceleration-mean-z
 - frequency-body-acceleration-jerk-mean-x
 - frequency-body-acceleration-jerk-mean-y
 - frequency-body-acceleration-jerk-mean-z
 - frequency-body-gyro-mean-x
 - frequency-body-gyro-mean-y
 - frequency-body-gyro-mean-z
 - frequency-body-acceleration-magnitude-mean
 - frequency-body-acceleration-jerk-magnitude-mean
 - frequency-body-gyro-magnitude-mean - frequency-body-gyro-jerk-magnitude-mean
