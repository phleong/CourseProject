This file contains descriptions of the steps carried out in run_script.r to obtain the clean dataset new_data.txt

#### The dataset is first downloaded and unzipped

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
