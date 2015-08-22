This file contains descriptions of the steps carried out in run_script.r to obtain the clean dataset new_data.txt

#### The required dataset is first downloaded and unzipped

#### Both the training and test data sets, labels, and subjects and loaded onto R
* train_set is the training set.
* train_label is the label (the activities carried out) for the training set.
* train_subject is the subject carrying out the activities for the training set.
* test_set is the test set.
* test_label is the label (the activities carried out) for the test set.
* test_subject is the subject carrying out the activities for the test set.

#### The training and test datasets are merged
* merged_set is the combined (using rbind) train_set and test_set.
* merged_label is the combined (using rbind) train_label and test_label.
* merged_subject is the combined (using rbind) train_subject and test_subject.

#### The measurements on the mean and standard deviation for each measurement is extracted
* features is the list of all features (which are the columns) of merged_set.
* extract_column is the indices of the features that corresponds to mean and standard deviations of the measurements. Features that contain the phrase "mean" or "std" (case sensitive) are chosen.
* extract_set is the subset of merged_set that contains only the columns as defined by extract_column.

#### The activities are labelled using descriptive labels
* activity contains the activity labels that correspond to each number as found on merged_label.
* merged_label now contains the activity labels in words instead of numbers to represent the activities.

#### The dataset is labelled using descriptive variable names
* features_name is the subset of features which corresponds to the columns selected for extract_column. The parenthesis "()" found in the name is removed to improve readability.
* The column names of extract_set is changed accordingly using feature_name.
* The column name of merged_label is changed to "Activity".
* The column name of merged_subject is changed to "Subject".
* The datasets: merged_subject, merged_label and extract_set are combined (using cbind). This combined dataset is called merged_data.

#### Find the average of each variable for each activity and each subject
* subject_num is the number of subjects in the dataset
* activity_num is the number of different activities in the dataset
* column_num is the number of columns required for the new dataset. This is the same as the number of columns in the dataframe merged_data.
* A new dataframe new_data is created. The name of each column corresponds to the name of merged_data. The only difference is that the first column is now "Activity", while the second column is "Subject". For the rest of the columns, the phrase "Average" is concatenated to the front of the variable names as the data of interest now is the average values of these variables.
* For loops are used to generate the values for each row of new_data. The average values for the measurements corresponding to the variable in each column is generated for each subject for every activity. 

#### The new data set new_data is written to "new_data.txt"
