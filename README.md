The README is supposed to explain how all of the scripts work
and how they are connected.  It explains the analysis files
and is supposed to be clear and understandable.

## Overview
There is one R program (script) that fulfills the instructions for this
project and it is named "run_analysis.R" as specified in the project
instructions.  The main function in that script is called "create_tidy_data()"
and this function fulfills all of the requirements for the project by calling
the rest of the functions in that file.  Below is a description of the
functions in this script implement the creation of the tidy data sets.

Step 1 of the instructions says to merge the training and the test sets
to create one data set.  See lines 398-443 of run_analysis.R for the
code that merges these data sets.  This portion of "create_tidy_data()"
reads in the components of the data sets by using the "read.fwf()"
(read fixed-width file) function, except for the file of subject IDs which
is read using the "scan()" function.  After changing the column name for
the subject IDs, this portion of "create_tidy_data()" uses the "cbind()"
function to combine the subject IDs, the activity IDs, and the measurement
data into one data frame - one for the training data and one for the test
data.  Then this portion of "create_tidy_data()" uses the "rbind()"
function to combine / merge the training and test data together into one
data set as specified in step 1 of the instructions.

Step 2 of the instructions says to extract only the measurements on the
mean and standard deviation for each measurement.  The Code Book (CodeBook.md)
has the details on all 66 of the mean and standard deviation values that
are extracted from the 561 total values in lines 447-465 of run_analysis.R.
A helper function "create_mean_std_integer_vector()" creates a vector of
all of the columns for the 66 mean and standard deviation values to be
subsetted out of the original raw data set.

Step 3 of the instructions says to use descriptive activity names to name
the activities (instead of the numerical values 1-6 in the raw data set).
See lines 469-477 of run_analysis.R where the activity column / variable
is changed to a factor variable and the factor variable levels are set
to descriptive activity names.

Step 4 of the instructions says to appropriately label the data set with
descriptive variable names.  See the Code Book (CodeBook.md) for the details
about these variable names.  See lines 481-484 of run_analysis.R for the
code that renames the variable column names using the helper function
"rename_data_set_columns()".

Step 5 of the instructions says to create a second, independent tidy
data set with the average of each variable for each activity and
each subject.  See lines 488-492 of run_analysis.R for the code that
creates the second data set using the helper function
"average_all_variables()".  The helper function used the "colMeans()"
function to calculate the averages after some manipulation of the
data to sort by subject ID and activity.
