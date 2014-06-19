setwd("U:/CSG/Coursera/Getting and Cleaning Data/assignment")

variable_names <- read.table("variable_names.txt", quote="\"")
variablenames <- as.list(as.character(variable_names$V1))
activity_labels <- read.table("activity_labels.txt", quote="\"")
names(activity_labels) <- c("labels", "activity")

test <- read.table("X_test.txt", quote="\"")
names(test) <- variablenames
subject_test <- read.table("subject_test.txt", quote="\"")
names(subject_test) <- "subject"
y_test <- read.table("y_test.txt", quote="\"")
names(y_test) <- "labels"

test <- cbind(subject_test, y_test, test)



train <- read.table("X_train.txt", quote="\"")
names(train) <- variablenames
subject_train <- read.table("subject_train.txt", quote="\"")
names(subject_train) <- "subject"
y_train <- read.table("y_train.txt", quote="\"")
names(y_train ) <- "labels"

train <- cbind(subject_train, y_train, train)


merge <- rbind(train, test)
library(plyr)
merge2 <- join(merge, activity_labels,  by = "labels", type = "left" )


extract <- merge2[,grepl("mean", names(merge2)) | grepl("std", names(merge2)) | names(merge2) %in% c("subject", "activity")]
meanFreqs <- merge2[,grepl("meanFreq", names(merge2))]
names_meanFreqs <- as.list(as.character(names(meanFreqs)))



library(reshape2)
melt <- melt(extract, id.vars = c("subject", "activity") )

melt2 <- melt[!(melt$variable %in% names_meanFreqs),]
table(melt2$variable)

cast_tidy <- dcast(melt2, value.var = "value", subject + activity ~ variable, mean)

write.table(cast_tidy, "tidy_cast.txt", row.names = FALSE, sep = "\t")

