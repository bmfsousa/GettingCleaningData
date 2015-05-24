#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5 .From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#1. Merges the training and the test sets to create one data set.
#Read all features
features <- read.table("features.txt")

#1.1 Get training data

trn_set <- read.table("train//X_train.txt")
names(trn_set) <- features[,2]
trn_label <- read.table("train//y_train.txt")
names(trn_label) <- "Activity"
trn_subject <- read.table("train//subject_train.txt")
names(trn_subject) <- "Subject"

#1.2 Get test data

tst_set <- read.table("test//X_test.txt")
names(tst_set) <- features[,2]
tst_label <- read.table("test//y_test.txt")
names(tst_label) <- "Activity"
tst_subject <- read.table("test//subject_test.txt")
names(tst_subject) <- "Subject"


#1.3 Merge training and test data
trainingData <- cbind(trn_label, trn_subject, trn_set)
testData <- cbind(tst_label, tst_subject, tst_set)

data <- rbind(testData, trainingData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

subset_feat <- c(1,2,which(grepl(pattern='mean\\(\\)',x=names(data)) | grepl(pattern='std\\(\\)',x=names(data))))

data <- data[, subset_feat]

#3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
data$Activity <- activities[data$Activity,2]



#5 .From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
second_data <- aggregate(data[,c(3:68)],by=list(data$Subject, data$Activity),FUN=mean)

names(second_data)[1:2] <- c("Subject","Activity")

# Create file with write.table() 
write.table(second_data, file = "tidy_data.txt", row.names=FALSE)