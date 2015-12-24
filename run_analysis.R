# Cleaning data project program. 24-12-2015. Miguel A. Riego
# Note: For this program to work, it must be in the parent directory, where the test and train folders are


# Make sure to have this library installed for step 5 to work:
library(dplyr)

# Read the .txt files into data tables:
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")
subtest <- read.table("./test/subject_test.txt")
subtrain <- read.table("./train/subject_train.txt")
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
y_test <- read.table("./test/Y_test.txt")
y_train <- read.table("./train/Y_train.txt")


# 1. Merges the training and the test sets to create one data set 
# Create 3 different sets for easier manipulation in next step
subdata <- rbind(subtest, subtrain)
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Find partial matchig in column names by using REGEX
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_std]
y_data[, 1] <- activities[y_data[, 1], 2]


# 3. Uses descriptive activity names to name the activities in the data set
names(x_data) <- features[mean_std, 2]
names(y_data) <- "Activity"


# 4. Appropriately labels the data set with descriptive variable names. 
names(subdata) <- "Subject"


# Create the one data set, with subject data and activity followed by measurements for easy readin in the next step
table_1 <- cbind(subdata, y_data, x_data)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# dplyr chaining magic:
table_2 <- table_1 %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(table_2, "output_table.txt", row.names = FALSE)
