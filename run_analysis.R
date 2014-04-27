setwd('/Users/serkanserttop/Downloads/ocw/DataScienceSpecialization/getdata-002/hw/proj-01/UCI_HAR_Dataset')

#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive activity names. 
#5. Creates a second, independent tidy data set with the average of each variable 
  #for each activity and each subject. 

get_data <- function() {
  test <- read.table('test/X_test.txt', header=FALSE)
  testY <- read.table('test/y_test.txt', header=FALSE)
  testSubject <- read.table('test/subject_test.txt', header=FALSE)
  
  train <- read.table('train/X_train.txt', header=FALSE)
  trainY <- read.table('train/y_train.txt', header=FALSE)
  trainSubject <- read.table('train/subject_train.txt', header=FALSE)
  
  all_test <- cbind(testSubject,testY,test)
  all_train <- cbind(trainSubject,trainY,train)
  rbind( all_test, all_train )
}

all <- get_data()

features <- read.table('features.txt', header=FALSE, stringsAsFactors =FALSE)
#this is the order in which we "cbound" in "get_data"
colnames(all) <- c('subject', 'activity', features[,2])

labels <- read.table("activity_labels.txt", header=FALSE, stringsAsFactors =FALSE)
#Labeling the activities
all$activity <- factor(all$activity, levels = labels[,1], labels = labels[,2])

#find column names that have mean and std in them
meanCols <- grep("-mean()", features[,2], fixed=TRUE)
stdCols <- grep("-std()", features[,2], fixed=TRUE)
#first two columns are subject and activity, we need to skip those
meanCols <- meanCols + 2
stdCols <- stdCols + 2

tidyCols <- c(1, 2, meanCols, stdCols)
allMeanAndStd <- all[,tidyCols]

library(reshape2)
#create an average for each subject (30) x each activity (6) => (180 rows)
tidyMelt <- melt(allMeanAndStd, id = c("subject","activity"))
tidyData <- dcast(tidyMelt, subject + activity ~ variable, mean)

#write.table(all, file = "all.txt", append=FALSE)
#write.table(allMeanAndStd, file = "allMeanAndStd.txt", append=FALSE)
write.table(tidyData, file = "tidyData.txt", append=FALSE)

