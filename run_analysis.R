setwd('D:/Learn/W4 Proj')

# Read data from raw files
x_train_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt") # data
y_train_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt") # labels
train_subjects <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt") # subjects

x_test_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt") # data
y_test_data    <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt") # labels
test_subjects <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt") # subjects

# Merge related raw files

df1 <- rbind(x_test_data,x_train_data)
df1_label <- rbind(y_test_data,y_train_data)
df1_subjects <- rbind(test_subjects,train_subjects)

# Extract measurements of mean and standard deviation

feature_names <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

mean_sd_features <- grepl("(-std\\(\\)|-mean\\(\\))",feature_names$V2)

rm_non_mean_sd <- df1[, which(mean_sd_features == TRUE)]

# Name the activities

activity_labels  <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

activity <- as.factor(df1_label$V1)

levels(activity) <- activity_labels$V2

subject <- as.factor(df1_subjects$V1)

rm_non_mean_sd <- cbind(subject,activity,rm_non_mean_sd)

# Label the activities

filtered_features <- (cbind(feature_names,mean_sd_features)[mean_sd_features==TRUE,])$V2

remover <- function(feature_name) {
  tolower(gsub("(\\(|\\)|\\-)","",feature_name))
}

filtered_features <- sapply(filtered_features,remover)

names(rm_non_mean_sd)[3:ncol(rm_non_mean_sd)] <- filtered_features

write.csv(rm_non_mean_sd,file="df1.csv")

write.table(rm_non_mean_sd, "df1.txt", sep="\t")

# 2nd df with average of each variable

library(reshape2)

melt_df1 <- melt(rm_non_mean_sd,id.vars=c("subject","activity"))

df2 <- dcast(melt_df1,subject + activity ~ variable,mean)

write.table(df2, "df2.txt", sep="\t")
