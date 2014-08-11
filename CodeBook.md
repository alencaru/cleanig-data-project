==================================
CODEBOOK
==================================
##PROJECT OF GETTING AND CLEANING DATA

####AUTHOR: Igor Demetrius Alencar

In this project the file 'run_analysis.R' performs all the merges and transformations in the input datasets. It generate as well the 'tity-dataset.csv' as an output.

- The input data is 'x_test', 'y_test' and 'x_train', 'y_train' as main Raw data.

- The 'activity_labels.txt' has the id for activity names.
- The 'features.txt is the file containing the column specifications/names.
- The 'flabel.txt' is the file that turns the names in the 'features.txt' more descriptive. It needs to be pasted in the same folder that 'features.txt' is.

- The 'tidy-dataset.csv' is the final tidy dataset with all the activity names, summarized variables and organized subjects.

The variables in tidy data are

- "Type" is the identification of original dataset: 'test' or 'train'.
- "Activity" is the variable containing the activity names.
- AverageMeanX is tBodyAcc-mean()-X, 
- AverageMeanY is tBodyAcc-mean()-Y,
- AverageMeanZ is tBodyAcc-mean()-Z,
- SdAverageX is tBodyAcc-std()-X, 
- SdAverageY is tBodyAcc-std()-Y, 
- SdAverageZ is tBodyAcc-std()-Z, 
