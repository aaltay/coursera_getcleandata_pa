# Assignment is done with multiple functions, first these functions are defined
# and later (at the end of the file) they are called one by one to complete the
# assignment.
# Assumes that data is extracted and in a folder named UCI HAR Dataset, in the working directory.

loadRawData <- function() {
    activity_labels <<- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('activity_id', 'activity'))
    features <<- read.table('UCI HAR Dataset/features.txt', col.names=c('feature_id', 'feature'))
    
    ## TODO: Names are wrong!!!
    xTest <- read.table('UCI HAR Dataset/test/X_test.txt')
    yTest <- read.table('UCI HAR Dataset/test/Y_test.txt', col.names=c('activity_id'))
    subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('subject'))
    
    xTrain <- read.table('UCI HAR Dataset/train/X_train.txt')
    yTrain <- read.table('UCI HAR Dataset/train/Y_train.txt', col.names=c('activity_id'))
    subjectTrain <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('subject'))
    
    # merge training and test data
    y <<- rbind(yTest, yTrain)
    x <- rbind(xTest, xTrain)
    subject <<- rbind(subjectTest, subjectTrain)
    
    # Add labels, Use original labels but replace -mean() and -std with Mean and Std
    # respectively, to make it all camel cased and easier to read.
    # We will not change other labels since we will drop themm eventually anyway.
    labels <- as.character(features[,'feature'])
    
    for (i in 1:length(labels)) {
        labels[i] <- sub('-mean\\(\\)', 'Mean', labels[i])
        labels[i] <- sub('-std\\(\\)', 'Std', labels[i])
        labels[i] <- sub('-', '', labels[i]) #Remove dashes as a general cleanup for shorter names
    }
    
    x <<- setNames(x, labels)
}

labelActivityData <- function() {
    flabel <- function(x) {activity_labels[x,'activity']}
    activity <- sapply(as.vector(y$activity_id), flabel)
    y_labeled <- data.frame(activity)
    x_labeled <<- cbind(y_labeled, x)
}

selectMeanAndStdData <- function() {
    mean_features <- features[grep('mean\\(', features$feature),]
    std_features <- features[grep('std\\(', features$feature),]
    meanstd_features <- rbind(mean_features, std_features)
    
    feature_indexes <- as.vector(meanstd_features$feature_id)

    # Because of activity we need to add +1 to feature indexes
    fPlusOne <- function (x) {x + 1}
    mean_std_colindexes <- sapply(feature_indexes, fPlusOne)
    
    #Also add index 1 to select activity name
    mean_std_colindexes <- append(c(1), mean_std_colindexes)
    
    data1 <<- x_labeled[,mean_std_colindexes]
}

tidyData <- function() {
    # New data.frame with added subject id
    data <- cbind(subject, data1)
    
    subjects <- length(unique(subject[,]))
    activities <- length(activity_labels[,1])
    columns <- length(data[1,])
    
    # We will have a new data frame with row_count = subjects * activities
    # column count will be same as data.
    
    data2 <- data.frame()
    row <- 1
    for (subject in 1:subjects) {
        for (activity_id in 1:activities) {
            activity <- as.character(activity_labels[activity_id,'activity'])
            data2[row, 1] <- subject
            data2[row, 2] <- activity
            for (column in 3:columns) {
                data2[row, column] <- mean(data[data$subject==subject & data$activity==activity,column])
            }
            row <- row + 1
        }
    }
    
    # Add the names, first two ar id names subject and activity
    # Rest of the names are copied from data but prepended with 'meanOf'
    labels <- names(data)
    for(column in 3:columns) {
        labels[column] <- paste('meanOf', labels[column], sep='')
    }
    data2 <<- setNames(data2, labels)
}

cleanAndSave <- function() {
    rm(envir=globalenv(), activity_labels, features, subject, x, x_labeled, y)
    write.table(data2, 'data2.txt', row.names = FALSE)
}

# TODO: Names? lower case remove () etc, paste adds ' ' in between.

loadRawData() # loads raw data from files and binds them
labelActivityData() # Mutates data to use descriptive activity names
selectMeanAndStdData() # data1 is produced by this function
tidyData() # data2 is produced by this function
cleanAndSave() # Remove not needed variables from environment and save data2 as text file