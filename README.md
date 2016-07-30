

COURSERA GETTING AND CLEANING DATA ASSIGNMENT
HENK PRETORIUS
JULY 2016

ABOUT THIS REPO

This repo hosts the R code and files for the Coursera Data Science's track course "Getting and Cleaning data".

This script uses data from the Human Activity Recognition Using Smartphones Dataset:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
 www.smartlab.ws

 FILES IN THIS REPO

 run_analysis.R is the script that achieves a tidy dataset as required by the assignment
 CodeBook.md contains the variables and their descriptions 

 WHAT THE SCRIPT DOES

 The script is called run_analysis and does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This final R object is called meandata and the table produced and saved is 

Notes in the actual script provide the detailed steps that achieves the above.
