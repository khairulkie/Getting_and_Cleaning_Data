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
    activity: Description of the variable ID_activity:
      For ID_activity 1 = "WALKING"
      For ID_activity 2 = "WALKING_UPSTAIRS"
      For ID_activity 3 = "WALKING_DOWNSTAIRS"
      For ID_activity 4 = "SITTING"
      For ID_activity 5 = "STANDING"
      For ID_activity 6 = "LAYING"
