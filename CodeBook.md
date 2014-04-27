This project consists of a single R file called "run_analysis.R" that aims to process data provided from the experiment mentioned below.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To get further information about the original experiment, a file called "original_experiment_README.txt" is provided. One should examine this document to learn more about the original experiment and the related files.


This project combines test and train data, then filters out columns that were not result of a mean or a standard deviation measurement. 

Training data were collected from the "train/" folder and test data were collected from the "test/" folder.

Below "?" indicates either "train" or "test".

- There are 2947 rows of data in test files and 7352 rows of data in train files.
- '?/y_?.txt': Single column list that identifies the "activity" by integer. Activities are also defined in activity\_labels.txt file where one can find 6 different activities: 1 WALKING, 2 WALKING\_UPSTAIRS, 3 WALKING\_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
- '?/subject_?.txt': Single column list that identifies the "subject". Subject range from 1 to 30.
- '?/X_/.txt': A data table that consists of 561 columns.
- Total number of columns is 563, with the addition of 'subject' and 'activity'


Merging Data
=========================================
- We first combine train and test data.
- As a result we have a "all" data table with 10,299 rows and 563 columns. 
- Only columns that pertain to the mean or standard deviation functions are kept, which lowers the number of columns to 68.
- Activity labels are worked in via "factors" function.
- By using the respahe2 library, a tidyData variable with 180 rows and 68 columns is generated.
- As a final step, tidyData is saved as a file called "tidyData.txt".
