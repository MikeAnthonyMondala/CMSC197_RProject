#Second Mini Project

getwd()
setwd("C://Users//Asus//Desktop//1//UCI HAR Dataset")


library("data.table")

activityLabels <- fread(("activity_labels.txt"), col.names = c("classLabels", "activityName"))
features <- fread(("features.txt"), col.names = c("index", "featureNames"))
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub('[()]', '', measurements)



setwd("C://Users//Asus//Desktop//1//UCI HAR Dataset//train")

train <- fread(("X_train.txt"))[, featuresWanted, with = FALSE]
setnames(train, colnames(train), measurements)
trainActivities <- fread(("Y_train.txt"), col.names = c("Activity"))
trainSubjects <- fread(("subject_train.txt"), col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)



setwd("C://Users//Asus//Desktop//1//UCI HAR Dataset//test")

test <- fread(("X_test.txt"))[, featuresWanted, with = FALSE]
setnames(test, colnames(test), measurements)
testActivities <- fread(("Y_test.txt"), col.names = c("Activity"))
testSubjects <- fread(("subject_test.txt"), col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)


combined <- rbind(train, test)


combined[["Activity"]] <- factor(combined[, Activity], levels = activityLabels[["classLabels"]], labels = activityLabels[["activityName"]])
combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])
combined <- melt(data = combined, id = c("SubjectNum", "Activity"))
combined <- dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

setwd("C://Users//Asus//Desktop//1//UCI HAR Dataset")

fwrite(x = combined, file = "tidyData.txt", quote = FALSE)