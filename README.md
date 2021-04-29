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

  Read the set of activity labels and transform the label codes into text string. Example codes as below:-

    activity_labels  <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

    activity <- as.factor(df1_label$V1)

    levels(activity) <- activity_labels$V2

  Apply the same concept towards the subject codes.
  
    subject <- as.factor(df1_subjects$V1)
    
  Then, include the subject and activity into the rm_non_mean_sd dataset.
  
    rm_non_mean_sd <- cbind(subject,activity,rm_non_mean_sd)
    
4. Appropriately labels the data set with descriptive variable names.

  By using the previously grouped mean and standard deviation features, the cleaned feature names will then be added to the result data set. A function 'remover' was created as to remove the unnecessary hyphens and parentheses while also apply lowercase to the letters. Example codes as below:-
  
    filtered_features <- (cbind(feature_names,mean_sd_features)[mean_sd_features==TRUE,])$V2

    remover <- function(feature_name) {
    tolower(gsub("(\\(|\\)|\\-)","",feature_name))
    }

    filtered_features <- sapply(filtered_features,remover)
  
  Then, the filtered features are added back to the rm_non_mean_sd dataset followed by write into a csv file and text file.
  
    names(rm_non_mean_sd)[3:ncol(rm_non_mean_sd)] <- filtered_features

    write.csv(rm_non_mean_sd,file="df1.csv")

    write.table(rm_non_mean_sd, "df1.txt", sep="\t")
    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  A funtion from reshape2 library called melt was used in this step. The melted rm_non_mean_sd dataset was re-organised to a tidy data set that met the requirement. Then, the dataset was written into a csv file and text file. Example codes as below:- 
    
     library(reshape2)

    melt_df1 <- melt(rm_non_mean_sd,id.vars=c("subject","activity"))

    df2 <- dcast(melt_df1,subject + activity ~ variable,mean)

    write.table(df2, "df2.txt", sep="\t")
