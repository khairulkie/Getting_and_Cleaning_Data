Code Book

This code book describes the variables, the data, and any transformations or work that have been performed to clean up the data.

Study Design

The related information with regards to the experiment can be found via http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones in the zip file containing the dataset.

In brief, 6 different activities performed by 30 volunteers while handling a smartphone, which paralelly captured various data about their motions.

Dataset

The dataset data computed by the script run_analysis.R includes all the mean and standard deviations measurements from the raw data, for both test and training datasets. Each row corresponds to a unique observation and includes the following variables:

   ID_subject: Value between 1 and 30. Identifies the subject of the measurements
   measurement_type: "TEST" or "TRAINING". Identifies the measurement type of the row
   ID_activity: value between 1 and 6. Identifies the activity measured and corresponds to the variable "activity"
   activity: An activity label, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
   t*: For this column name and all that follow, it is best to refer to the features_info.txt file from the original dataset. 
   f*: For this column name and all that follow, it is best to refer to the features_info.txt file from the original dataset.
   
 In short, all the following column names that contain std are standard deviation measures, and all that contain mean are its average. Time domain variables begin with t, time frequency domain variables begin with f. Variables containing acc refer to acceleration values.
