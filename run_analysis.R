setwd("./UCI HAR Dataset")
testx <- read.table("./test/X_test.txt", header = F)
testy <- read.table("./test/y_test.txt", header = F)
testsubject <- read.table("./test/subject_test.txt", header = F)
trainx<- read.table("./train/X_train.txt", header = F)
trainy <- read.table("./train/y_train.txt", header = F)
trainsubject <- read.table("./train/subject_train.txt", header = F)
features <- read.table("features.txt", header = F)
activity_labels <- read.table("activity_labels.txt", header = F)
names(trainx) <- features[,2]
names(testx) <- features[,2]
names(trainy) <- "Activity"
names(testy) <- "Activity"
names(trainsubject) <- "Subject"
names(testsubject)<-"Subject"
grep <- grep("([mM]ean|[sS]td)[/(][/)]$",names(testx))
trainx2 <- trainx[,grep]
testx2 <- testx[,grep]
training <- cbind(trainsubject,trainx2,trainy)
test <- cbind(testsubject,testx2,testy)
data <- rbind(training,test) 
data$Activity <- factor(data$Activity,labels=activity_labels[,2])
library(dplyr)
data <- select(data, Subject, Activity, c(2:19))
library(reshape2)
data1 <- melt(data, measure.vars = c(3:20))
data2 <- dcast(data1, Subject + Activity ~ variable, mean)

write.table(data2,"SummarySamsungData.txt",quote=F,row.names=F)
