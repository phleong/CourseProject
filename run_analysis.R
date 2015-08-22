## Download the file and unzip it
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")

## Load the datasets
## Training data
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_label <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Test data
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_label <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## 1. Merge the training and test data
merged_set <- rbind(train_set, test_set)
merged_label <- rbind(train_label, test_label)
merged_subject <- rbind(train_subject, test_subject)

## 2. Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
extract_column <- grep("mean|std",features[,2])
extract_set <- merged_set[,extract_column]

## 3. Use descriptive activity labels to name the activities
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
descriptive_label <- activity[merged_label[,1],2]
merged_label[,1] <- descriptive_label

## 4. Label the data set with descriptive variable names
features_name <- gsub("\\(\\)", "", features[extract_column,2]) # Remove "()" 
names(extract_set) <- features_name
names(merged_label) <- "Activity"
names(merged_subject) <- "Subject"
merged_data <- cbind(merged_subject, merged_label, extract_set)

## 5. Average of each variable for each activity and each subject
subject_num <- dim(unique(merged_subject))[1]
activity_num <- dim(unique(merged_label))[1]
column_num <- length(extract_column)+2
new_data <- matrix(nrow = subject_num*activity_num, ncol = column_num)
new_data <- as.data.frame(new_data)
names(new_data) <- c("Activity", "Subject", paste("Average", features_name))
for(i in 1:activity_num){
        for(j in 1:subject_num){
                ind_now <- (i-1)*subject_num+j
                new_data[ind_now, 1] <- as.character(activity[i,2])
                new_data[ind_now, 2] <- j
                isin <- (merged_data[,2] == activity[i,2]) & (merged_data[,1] == j)
                new_data[ind_now, 3:column_num] = colMeans(merged_data[isin,3:column_num])
        }
}
        
write.table(new_data, "new_data.txt", row.name=FALSE)
