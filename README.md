# Getting_and_Cleaning_Data

Requirements as stated for the projects are followed. The steps are explained as below:-

1. Merges the training and the test sets to create one data set.

  Read the data, label and subject for both train and test data in the provided raw files. Example codes as
  below:-

    x_train_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  
    y_train_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
    
    train_subjects <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

  Then, the related raw data tables merge in row-wise manner. Example codes as below:-
  
    df1 <- rbind(x_test_data,x_train_data)
    
    df1_label <- rbind(y_test_data,y_train_data)
    
    df1_subjects <- rbind(test_subjects,train_subjects)
  
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  Read the feature names and identify the ones with standard deviation or means using grep function, assuming
  the names contains either '-std()' or '-mean()' text string. Example codes as below:-

    feature_names <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

    mean_sd_features <- grepl("(-std\\(\\)|-mean\\(\\))",feature_names$V2)

  Then, non-related columns are removed accordingly.
  
    rm_non_mean_sd <- df1[, which(mean_sd_features == TRUE)]
  
3. Uses descriptive activity names to name the activities in the data set



