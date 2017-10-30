# This script does the following
# 0. Reads in the relevant datafiles
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

# Step 0.
# sets wd to right folder
setwd("/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1")

# reads training set into trainingset
file1 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/train/X_train.txt"
trainingset <- read.table(file1)

# reads test set into testset
file2 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/test/X_test.txt"
testset <- read.table(file2)

# reads training labels into trainactivity
file3<- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/train/y_train.txt"
trainingactivity <- read.table(file3)

# reads test labels into testactivity
file4 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/test/y_test.txt"
testactivity <- read.table(file4)
    1
# reads subject of training into trainsubject 
file5 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/train/subject_train.txt"
trainingsubject <- read.table(file5)

# reads subject of test into testsubject 
file6 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/test/subject_test.txt"
testsubject <- read.table(file6)


# Step 1-4
# Creates one dataset. the first 7352 rows come form trainingset, the next 2947 rows from testset
dataset <- rbind(trainingset, testset)

# creates one activity set
activityset <- rbind(trainingactivity, testactivity)

# creates one subject set
subject <- rbind(trainingsubject,testsubject)

library(dplyr)

# reads in the names of the features, i.e. these should become the column names of the dataset
file7 <- "/home/jgdopper/Documenten/Coursera/Data_Science/3_Getting_and_Cleaning_Data/Assignment_1/UCI HAR Dataset/features.txt"
features <-read.table(file7)
colnames(dataset) <- features[,2]  # replaces variable names by the feature name

# datatset_msd contains those columns which refer to "mean" or "std", or the firs two "variants" of each variable. 
# I excluded the "meanFreq".
dataset_msd <- dataset[ , grepl( "mean\\(|std\\(" , names(dataset) ) ]



# replace coding by a descriptive activity name
activityset$V1[activityset$V1==1] <- "walking"
activityset$V1[activityset$V1==2] <- "walking_upstairs"
activityset$V1[activityset$V1==3] <- "walking_downstairs"
activityset$V1[activityset$V1==4] <- "sitting"
activityset$V1[activityset$V1==5] <- "standing"
activityset$V1[activityset$V1==6] <- "laying"
# replace variable by a descriptive variable
names(activityset) <- "activity"
names(subject) <- "subject"

# add the subject and activity to the datatset2
dataset3 <- cbind(subject, activityset, dataset2)

# Use descriptive variable names by setting "time" and "fourier" in the name of the variable 
# instead of "t" and "f".
# I consider the rest of the variable label already descriptive
names <- names(dataset3)
names <-sub("tB","timeB",names)
names <-sub("tG","timeG",names)
names <-sub("fB","fourierB",names)
names <-sub("fG","fourierG",names)
names(dataset3) <- names

# Step 5.
# Creates a independent tidy dataset "datamean" with the average of each variable for each activity and each subject
# The variable names are change by adding "mean" to indicate that the data is mean data.
datamean <- dataset3 %>% group_by(subject, activity) %>% summarise_all(mean)
names(datamean) <- gsub("$", "-mean", names(datamean))