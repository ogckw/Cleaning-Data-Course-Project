
##Read the files
fealb <- read.table("./UCI HAR Dataset/features.txt")
te<- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=fealb[,2])
tr<- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=fealb[,2])

##Merge two files
me<-rbind(te,tr)

##Extract the measurements means&standard deviation
ms <- fealb[grep("(mean|std)\\(", fealb[,2]),]
msv <- me[, ms[,1]]

##Use descriptive activity names to name the activities in the data set##
yte <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))
ytr <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))
y<- rbind(yte, ytr)

##Label the data set with descriptive variable names
lb <- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(lb)) {
  code <- as.numeric(lb[i, 1])
  name <- as.character(lb[i, 2])
  y[y$activity == code, ] <- name
}
##Create a second independent tidy data set with the average of each variable for each activity and each subject
subte <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
subtr <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subm <- rbind(subte, subtr)
avg <- aggregate(msv, by = list(activity = y[,1], subject = subm[,1]), mean)

write.table(avg, file="result.txt", row.names=FALSE)



