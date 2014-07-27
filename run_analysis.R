# This R program belongs to the Coursera course "Getting and Cleaning Data" from Johns Hopkins University
# It's part of the course project

# (1) Merges the training and the test sets to create one data set.

# (1a) Read training data sets, create row numbers as values for the ID column and merge all three
trainSet = read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))
trainSet$ID <- as.numeric(rownames(trainSet))
trainX = read.table("UCI HAR Dataset/train/X_train.txt")
trainX$ID <- as.numeric(rownames(trainX))
trainY = read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity_id"))  
trainY$ID <- as.numeric(rownames(trainY))
trainMerged <- merge(trainSet, trainY, all=TRUE)
trainMerged <- merge(trainMerged, trainX, all=TRUE)

# (1b) Read test data sets, create row numbers as values for the ID column and merge all three
testSet = read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
testSet$ID <- as.numeric(rownames(testSet))
testX = read.table("UCI HAR Dataset/test/X_test.txt")
testX$ID <- as.numeric(rownames(testX))
testY = read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity_id"))
testY$ID <- as.numeric(rownames(testY))
testMerged <- merge(testSet, testY, all=TRUE) 
testMerged <- merge(testMerged, testX, all=TRUE) 

# (1c) Combine merged train and test data sets
oneSet_Step1 <- rbind(trainMerged, testMerged)

# (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
featureSet = read.table("UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_label"),)
selectedFeatures <- featureSet[grepl("mean\\(\\)", featureSet$feature_label) | grepl("std\\(\\)", featureSet$feature_label), ]
oneSet_Step2 <- oneSet_Step1[, c(c(1, 2, 3), selectedFeatures$feature_id + 3) ]

# (3) Uses descriptive activity names to name the activities in the data set
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_label"),)
oneSet_Step3 = merge(oneSet_Step2, activityLabels)

# (4) Appropriately labels the data set with descriptive variable names. 
selectedFeatures$feature_label = gsub("\\(\\)", "", selectedFeatures$feature_label)
selectedFeatures$feature_label = gsub("-", ".", selectedFeatures$feature_label)
for (i in 1:length(selectedFeatures$feature_label)) {
    colnames(oneSet_Step3)[i + 3] <- selectedFeatures$feature_label[i] 
	}
oneSet_Step4 = oneSet_Step3

# (5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
dropData <- c("ID","activity_label")
oneSet_Step5 <- oneSet_Step4[,!(names(oneSet_Step4) %in% dropData)]
tidyDataSet <-aggregate(oneSet_Step5, by=list(subject = oneSet_Step5$subject_id, activity = oneSet_Step5$activity_id), FUN=mean, na.rm=TRUE)
dropData <- c("subject","activity")
tidyDataSet <- tidyDataSet[,!(names(tidyDataSet) %in% dropData)]
tidyDataSet = merge(tidyDataSet, activityLabels)
write.table(tidyDataSet, file="tidyDataSet.txt", row.names=FALSE, sep='\t')
