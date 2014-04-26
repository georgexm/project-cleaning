project-cleaning
================

Getting and Cleaning Data Project

1. Preparation
--------------

1.1. Download the data from the data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1.2. Extract the data in you working directory - this should create a "UCI HAR Dataset" folder with all subfolders and files.

1.3. Download run_analysis.R from github and place it in your working directory.

1.4. Install the library data.table

1.5. Open and run the "run_analysis.R" in R




2. What the code will do (+ assumptions and rasoning about data)
----------------------------------------------------------------

2.1. Loads the training and test data from folders train and test - files X_train.txt and X_test.txt

2.2. Merges the files X_train.txt and X_test.txt in data frame data.x

2.3. Names the columns of data.x using the file features.txt where the names of all measuremets are stored


2.4. Loads and merges the training and test class labels in data frame data.y

2.5. Replaces the class labels with their proper activity name that is stored in the file activity_labels.txt

2.6. Names the column "activity"

2.7. Loads and merges the training and test subjects in data frame data.s - from the files subject_train.txt and subject_test.txt

2.8. Names the column "subject"

2.9. Merges data.x, data.y and data.s in a single data frame called data

2.10. Using grep to select the columns containing std() and mean(), but not meanfreq() - as all the measurements have mean() and only some of them have both mean() and meanfreq(), I decided that mean() is what is needed

2.11. Extracts the columns containing std() and mean() in a new data frame - data.ms

2.12. Using lapply to calculate the means and create a data set of means by subject and activity - data.mean

2.13. Write the data in a file tidy_mean.txt

