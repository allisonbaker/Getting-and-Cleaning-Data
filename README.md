Getting-and-Cleaning-Data
=========================

Coursera Course

The script merges the following files and outputs a tidy data set, in tab-delimited format

Files merged:
variable_names.txt - variable names for the 561 variables
activity_labels.txt - activity labels, correpsonding to "y_test.txt" and "y_train.txt" data
subject_test.txt - subject ids for testing data set
X_test.txt - actual testing data set
y_test.txt - labels for testing data set
X_train.txt - actual training data
subject_train.txt - subject ids for training data set
y_train.txt - labels for training data set

1) assign variable names to testing and trainging data sets, from variable_names.txt
2) cbind the subject ids and the labels, for both training and testing data sets
3) rbind testing and training data sets
4) left join data from 3) with activity labels
5) extract the "std" and "mean" variables from 4)
6) melt the data from 5)
7) remove any variables with "meanFreq" in their names
8) cast the data from 7) into a tidy data set
9) write the tidy data set to a tab delimited file and save it locally

Final "cast_tidy.txt" data set includes 180 observations, across 68 variables
