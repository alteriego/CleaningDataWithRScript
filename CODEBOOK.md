# Code Book for the Assignment

## Variables
The first few lines of code after the DPLYR import turn the existing (downloaded/extracted) files into data.tables:

+ For names:
  > **features** <- read.table("features.txt")
  > **activities** <- read.table("activity_labels.txt")

+ For activity codes
  > **subtest** <- read.table("./test/subject_test.txt")
  > **subtrain** <- read.table("./train/subject_train.txt")

+ For actual data:
  > **x_test** <- read.table("./test/X_test.txt")
  > **x_train** <- read.table("./train/X_train.txt")
  > **y_test** <- read.table("./test/Y_test.txt")
  > **y_train** <- read.table("./train/Y_train.txt")

+ It then pulls all the data and creates the following intermediate files through row binds:
  > **subdata** - subtest and subtrain
  > **x_data** - x_test and x_train
  > **y_data** - y_test and y_train

+ Creates the **mean_std** vector by using REGEX

+ Then does a little subsetting and name replacement

+ And creates **Table 1** through column bind (for step 4) 

+ And **Table 2** (for step 5) through a small DPLYR chain
