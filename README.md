# GettingAndCleaningData

This repo contains the code for the Assignment 1 of the "Getting and Cleaning Data" course of Coursera. The purpose of this repo is to demonstrate my ability to collect, work with and clean a data set.


then generates a hen generates a tidy data text file that meets the principles of tiny data.

# run_analysis.R
 This script does the following
 
 0. Reads in the relevant datafiles
 1. Merges the training and the test sets to create one data set. Thsi set is called "dataset".
 2. Extracts only the measurements on the mean and standard deviation for each measurement. These are the columns which refer to "mean" or "std", which are the first two varainats of each variable.
 3. Uses descriptive activity names to name the activities in the data set. These are taken form the activity_labels.txt file form the dataset
 4. Appropriately labels the data set with descriptive variable names y setting "time" and "fourier" in the name of the variable instead of "t" and "f".
 5. From the data set in step 4, creates a second, independent tidy data set with the 
    average of each variable for each activity and each subject. This daset is called "datamean" and exported as "mydata.txt".

In order to perform run this script properly, you need to download the dataset, see below.
Secondly, you need to change the working directory in the script to your own working directory.

# Used Dataset

One of the most exciting areas in all of data science right now is wearable computing. The dataset represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In order to have the script running properly, unpack the .zip file in the same folder as where the script is saved.


# CodeBook
The codebook describes the variables of the final, tidy, dataset.

