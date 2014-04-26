
# The data source is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The data should be extracted in the "UCI HAR Dataset" directory
# The directory "UCI HAR Dataset" should be placed in your  working directory


# 1. Merges the training and the test sets to create one data set.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 

data.x1 <- read.table("UCI HAR Dataset/train/X_train.txt")
data.x2 <- read.table("UCI HAR Dataset/test/X_test.txt")
data.x <- rbind(data.x1, data.x2)

features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <-tolower(features$V2)
names(data.x) <- features$V2

data.y1 <- read.table("UCI HAR Dataset/train/Y_train.txt")
data.y2 <- read.table("UCI HAR Dataset/test/Y_test.txt")
data.y <- rbind(data.y1, data.y2)

activity <- read.table("UCI HAR Dataset/activity_labels.txt")
data.y[,1] <- tolower(activity[data.y[,1],2])
names(data.y) <- "activity"

data.s1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
data.s2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
data.s <- rbind(data.s1, data.s2)
names(data.s) <- "subject"

data <- cbind(data.s, data.y, data.x)


# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.

x <- grep("-mean\\(\\)|-std", features$V2)
z<-x+2
data.ms<- data[c(1,2,z)]



# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 

library(data.table)
data.dt<- data.table(data.ms)
data.mean<- data.dt[, lapply(.SD, mean), by=c("subject", "activity")]

# Saving the clean data set

write.table(data.mean, file = "tidy_mean.txt")
