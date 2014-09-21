
This project is for cleaning the data from accelerometers from the Samsung Galaxy S smartphone

one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each       activity and each subject.

   R script detail:

1.Read the file from working directory
  (you should download the file and unzip in R's working directory.  
   file URL:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2.Use rbind() to merge file

3.Use grep() to get the subset of mean and standard deviation which is in data.frame called "msv"

4.Load the activity name from working directory

  use cbind() to label the activity names to data set

  mean and standard deviation with lebel called "msvlb"  

5.Use aggregate() function to calculate by mean on "msv" and get the averages each subject and activity.
  
  Then,Output result.txt in working drirectory.

 

