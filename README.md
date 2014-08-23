# README

Analysis is done in multiple functions each doing a small piece of the work. They are called one by one to complete the assignment. These functions makes the following assumption:

 * ASSUMPTION: Data is extracted and in a folder named UCI HAR Dataset, in the working directory.

These functions are explained in the order they are executed.

## Loading raw data

loadRawData() function loads the data and performs some basic operations on it.

1. It loads data from data file. All the data that is required is loaded at this step.
2. Binds training and test data together
3. Adds describtive labels. Descriptive labels are created by copying the feature labels and doing basic modifications on them. '-mean()' and '-std' replaced with 'Mean' and 'Std' respectively and extra '-' are removed. This results in short, descriptive and easy to read camel case labels

## Use descriptvie activity names

labelActivityData() function adds decriptive activity names using the information from 'activity_labels.txt' data file. It does this by

1. Creating a new labeled_y variable that has a variable name 'activity' and each row is calculated based on the activity_id in the original y data. 
2. A new labeled_x variable is created by binding labeled_y and original x variables,

## Selecting Mean and Std features

selectMeanAndStdData() function extracts mean and standard deviation for each measurement. It also creates the first data set. This is done by

1. Selecting features that contains the names -mean() or -std(). Note that some features such as meanFreq are ignored here because they were not included in the set of variables that were estimated directly using a mean() function. (And assignment was flexible here in terms of selecting the set of features.)
2. A new data set (data1) is created by selecting the above features together with the activity name from the base set.

## Tidy Data

tidyData() function creates the second data set. It creates a 180 (30 subjects * 6 activities) by 68 features data frame. This is done by

1. Binding subjects to the data1 dataset
2. Iterating over data set for each subset of subject-activity pair and calculating mean for each selected feature
3. Features are labeled as the data1 dataset but 'meanOf' prefix is added to underline that they are the mean of the above calculated features.

## Saving Data

cleanAndSave function removes not needed variables from the environment and saves the data2 dataset as text file for submission.