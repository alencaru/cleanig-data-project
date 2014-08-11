###That file describes how the run_analysis.R script works

####1 The first part of the script set all files into objects in R.
The objects are:
- activity_label as **label**
- features.txt as **clabel**
- flabel.txt file **flabel**
- X_test.txt as **testx**
- y_test.txt as **testy**
- X_train.txt as **trainx**
- y_train.txt as **trainy**

####2 The second part of the script takes the objects of test and train data and merges x test with y test and x train with y train.

Before merge the script creates a *id* variable for each object.
- creation of *id* variable
- test is a merge of testx with testy
- train is a merge of trainx with trainy

Than the script takes a *sqldf* function to join test with label (activity_label), and train with label.
The result of that function is:
- testt 
- trainn

Later the script takes **testt** and **trainn** objects and join each one with **clabel** (object with colnames).
So we got the **testt** and **trainn** object with *colnames* and id variable and activity names as well.

3 The third part of the script split testt and trainn taking only means and std variables.
The script put new variables names based on file:*flabel.txt*. 
This part also creates a final merged dataset called *tidydata* and also a final out table called tidy.data.csv.

#####OBS:
In the last part of the run_analysis script there is a code commented. If you want see a final dataset organized by test and train you can uncomment and run this part of code. It will create a final out file called: **tity-dataset.csv** summarized by test and train.
