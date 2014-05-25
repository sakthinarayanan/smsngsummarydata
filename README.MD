 run_analysis.R does the following 
1. Merges the training and the test sets to create one data set.
estx <- read.table("./test/X_test.txt", header = F)
testy <- read.table("./test/y_test.txt", header = F)
testsubject <- read.table("./test/subject_test.txt", header = F)
trainx<- read.table("./train/X_train.txt", header = F)
trainy <- read.table("./train/y_train.txt", header = F)
trainsubject <- read.table("./train/subject_train.txt", header = F)
features <- read.table("features.txt", header = F)

2.Extracts only the measurements on the mean and standard deviation for each measurement. 
grep <- grep("([mM]ean|[sS]td)[/(][/)]$",names(testx))

3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
names(trainx) <- features[,2]
names(testx) <- features[,2]
names(trainy) <- "Activity"
names(testy) <- "Activity"
names(trainsubject) <- "Subject"
names(testsubject)<-"Subject"

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
write.table(data2,"SummaryData.txt",quote=F,row.names=F)