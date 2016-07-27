# Load packages used in script
require(reshape2)
require(dplyr)
require(plyr)

# Set working directory for script
setwd("./UCI HAR Dataset/")

# Get featurenames and activity labels, and retain only names vector by subsetting on second column
featurenames <- read.table(("features.txt"))
featurenames <- featurenames[,2]
activitylabelnames <- read.table(("activity_labels.txt"))
activitylabelnames <- activitylabelnames[,2]

# Get files from the test sub folder: subject list, labels and data. 
# Then assign column names in the dataset based on feature names imported earlier
# Column bind subject variable, activity labels and test data into one dataset
# Rename first two columns (subjectnr and activitylabels) of new merged dataset
testsubjects <-read.table("./test/subject_test.txt")
testlabels <- read.table("./test/Y_test.txt")
test <- read.table("./test/X_test.txt")
colnames(test) <- featurenames
testdata <- cbind(testsubjects,testlabels, test)
colnames(testdata)[1] <- "subjectnr"
colnames(testdata)[2] <- "activitylabels"

# Get files from the train sub folder: subject list, labels and data. 
# Then assign column names in the dataset based on feature names imported earlier
# Column bind subject variable, activity labels and train data into one dataset
# Rename first two columns (subjectnr and activitylabels) of new merged dataset
trainsubjects <- read.table("./train/subject_train.txt")
trainlabels <- read.table("./train/Y_train.txt")
train <- read.table("./train/X_train.txt")
colnames(train) <- featurenames
traindata <- cbind(trainsubjects,trainlabels, train)
colnames(traindata)[1] <- "subjectnr"
colnames(traindata)[2] <- "activitylabels"

# Merge the training and test data sets which are both now in the same format with the same column order and names
alldata <- rbind(testdata, traindata)

# Convert activity labels variable to factor and rename levels according to feature names
alldata$activitylabels <- as.factor(alldata$activitylabels)
alldata$activitylabels <- revalue(alldata$activitylabels, c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", 
                                                            "4" = "SITTING", "5"="STANDING", "6"="LAYING"))

# Subset data based on columns with mean and standard deviations only, keep subjectnr and activity labels
alldatasubset <- alldata[,grep(("subjectnr|activitylabels|mean|std"), colnames(alldata))]
alldatasubset$subjectnr <- as.factor(alldatasubset$subjectnr)

# Melt data and cast new tidy dataset with mean per subject by activity label, write new table as tidy txt file
melteddata <- melt(alldatasubset, id = c("subjectnr", "activitylabels"))
meandata <- dcast(melteddata, subjectnr + activitylabels ~ variable, mean)
write.table(meandata, "meandata.txt", sep="\t")
