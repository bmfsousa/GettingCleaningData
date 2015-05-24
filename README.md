# Getting and Cleaning Data Project


## Purpose of this project
This repository contains the data files and R scripts for the Peer Assessment assignment necessary for this course project, and the result of this execution of the script.


The R script assumes it is located in the present working directory
as the data used in this assignment (downloaded and unzipped in the working directory).

The script executes the next steps:

* Merges the training and the test sets to create one data set, from the files "train/X_train.txt", "train/y_train.txt", "train/subject_train.txt", "test/X_test.txt", "test/y_test.txt", "test/subject_test.txt" and "features.txt". In this step, the labels data set are defined ("Subject", "Activity" and the name of the measurements, using the file features.txt);

* Extracts only the measurements on the mean and standard deviation for each measurement, using the file features.txt to identify this measurements. This task is made with grepl function;

* Uses descriptive activity names to name the activities in the data set, using the file activity_labels.txt;

* From the data set in last step, creates a second, independent tidy data set with the average of each variable for each Activity and each Subject, creating the file tidy_data.txt in the working directory. In this step, the labels data set are defined (Subject, Activity).