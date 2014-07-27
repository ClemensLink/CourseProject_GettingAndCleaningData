This course project belongs to the Coursera course "Getting and Cleaning Data" from Johns Hopkins University

## The R Script

The R script performs the following tasks:
 * (1) merges the training and the test sets to create one data set.reads training data sets, create row numbers as values for the ID column and merge all three
 * (1a) reads training data sets, create row numbers as values for the ID column and merge all three
 * (1b) reads test data sets, create row numbers as values for the ID column and merge all three
 * (1c) combines merged train and test data sets
 * (2) extracts only the measurements on the mean and standard deviation for each measurement
 * (3) uses descriptive activity names to name the activities in the data set
 * (4) appropriately labels the data set with descriptive variable names
 * (5) creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

This script assumes the extracted Samsung data in the working directory in a folder named UCI HAR Dataset. 
It processes the data and generates the tidy dataset.

```r
source('./run_analysis.R')
run.analysis()
```

## The data sets

### The raw data

The raw data set contains 68 variables as described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones:

 * `subject` - identifier of the subject who carried out the experiment.
 * `label` - activity label.
 * The 66 other features are `described as follows (quoted from the source mentioned above)`: 

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
were filtered using a median filter and a 3rd order low pass Butterworth filter
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the
magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.
 * `tBodyAcc-XYZ`
 * `tGravityAcc-XYZ`
 * `tBodyAccJerk-XYZ`
 * `tBodyGyro-XYZ`
 * `tBodyGyroJerk-XYZ`
 * `tBodyAccMag`
 * `tGravityAccMag`
 * `tBodyAccJerkMag`
 * `tBodyGyroMag`
 * `tBodyGyroJerkMag`
 * `fBodyAcc-XYZ`
 * `fBodyAccJerk-XYZ`
 * `fBodyGyro-XYZ`
 * `fBodyAccMag`
 * `fBodyAccJerkMag`
 * `fBodyGyroMag`
 * `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are: 
 * `mean()`: Mean value
 * `std()`: Standard deviation

### The tidy data

The tidy data set contains the same variables as the raw data. These variables are renamed to ease readability and drive consistency. Details see comments in `run_analysis.R`
