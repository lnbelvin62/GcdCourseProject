# This script should do the following:
#
# 1)  Merges the training and the test sets to create one data set.
#
# 2)  Extracts only the measurements on the mean and standard deviation
#     for each measurement.
#
# 3)  Uses descriptive activity names to name the activities in the
#     data set.
#
# 4)  Appropriately labels the data set with descriptive variable names.
#
# 5)  From the data set in step 4), creates a second, independent
#     tidy data set with the average of each variable for each activity
#     and each subject.


read_training_test_data <- function(parent_dir, training = TRUE) {

    # Read the training or test data from the given parent directory.
    # If the input parameter "training" is TRUE, read the training data.
    # If the input parameter "training" is FALSE, assume that the caller
    # wants to read the test data and read that data.
    training_data_file_path <- 'train/X_train.txt'
    test_data_file_path <- 'test/X_test.txt'

    # Concatenate the parent path and the training / test data file path
    # with no separator (also, a forward slash is needed between the
    # parent path and the training / test data file path).
    if (training == TRUE) {
        data_file_path <- paste(parent_dir, '/', training_data_file_path,
                                sep = "")
    } else {
        data_file_path <- paste(parent_dir, '/', test_data_file_path,
                                sep = "")
    }

    # The raw data files (both the training data and the test data)
    # are fixed-width text files where each line in the file is 8976
    # characters long - 561 variables x 16 characters per variable
    # plus 1 for the control-M at the end of each line.  Thus we can
    # read the data file using "read.fwf" (read a fixed-width file)
    # and specifying 16 for the character width for each of the 561
    # variables - use "rep" (repeat) to construct an integer vector
    # with the 561 widths.  (We can ignore the control-M at the end
    # of each line).  Note that there are no header rows in either
    # the training or test data, so there are no lines / rows that
    # need to be skipped over.
    data <- read.fwf(file = data_file_path, widths = c(rep(16, each = 561)))
}


read_training_test_activity_data <- function(parent_dir, training = TRUE) {

    # Read the activity training or test data from the given parent directory.
    # If the input parameter "training" is TRUE, read the activity training
    # data.  If the input parameter "training" is FALSE, assume that the
    # caller wants to read the activity test data and read that data.
    training_activity_data_file_path <- 'train/y_train.txt'
    test_activity_data_file_path <- 'test/y_test.txt'

    # Concatenate the parent path and the training / test activity data file
    # path with no separator (also, a forward slash is needed between the
    # parent path and the activity training / test data file path).
    if (training == TRUE) {
        activity_file_path <- paste(parent_dir, '/',
                                    training_activity_data_file_path, sep = "")
    } else {
        activity_file_path <- paste(parent_dir, '/',
                                    test_activity_data_file_path, sep = "")
    }

    # The raw data activity files (both the training data and the test data)
    # are fixed-width text files where each line in the file is just 2 bytes
    # long - one byte is the activity number (a number between 1 and 6) and
    # the other byte is the carriage return / newline.  Thus we can read the
    # data file using "read.fwf" (read a fixed-width file) and specifying
    # 1 for the character width.
    data <- read.fwf(file = activity_file_path, widths = c(1))
}


read_training_test_subject_data <- function(parent_dir, training = TRUE) {

    # Read the subject training or test data from the given parent directory.
    # If the input parameter "training" is TRUE, read the subject training
    # data.  If the input parameter "training" is FALSE, assume that the
    # caller wants to read the subject test data and read that data.
    training_subject_data_file_path <- 'train/subject_train.txt'
    test_subject_data_file_path <- 'test/subject_test.txt'

    # Concatenate the parent path and the training / test subject data file
    # path with no separator (also, a forward slash is needed between the
    # parent path and the subject training / test data file path).
    if (training == TRUE) {
        subject_file_path <- paste(parent_dir, '/',
                                   training_subject_data_file_path, sep = "")
    } else {
        subject_file_path <- paste(parent_dir, '/',
                                   test_subject_data_file_path, sep = "")
    }

    # The raw data subject files (both the training data and the test data)
    # are NOT fixed-width text files, since some lines have two bytes (one
    # byte for the subject number and one byte for the carriage return /
    # newline), while other lines have three bytes (two bytes for the subject
    # number and one byte for the carriage return / newline).  Thus we will
    # use the "scan" function to read this file.
    data <- scan(subject_file_path)
}


create_mean_std_integer_vector <- function() {

    # Create an integer vector that contains the column numbers (indexes)
    # for the 66 mean and standard deviation values described in CodeBook.md,
    # as well as the subject and activity columns.  Note that all of the
    # mean / standard deviation column values in this function are 2 greater
    # than the column values listed in CodeBook.md because of the
    # prepended subject and activity columns.  Use the abbreviated variable
    # names from the raw data set for the variable names in this function.
    # The renamed variables are listed and described in CodeBook.md.

    subject_column <- c(1)
    activity_column <- c(2)
    tbody_acc_columns <- c(3, 4, 5, 6, 7, 8)
    tgravity_acc_columns <- c(43, 44, 45, 46, 47, 48)
    tbody_acc_jerk_columns <- c(83, 84, 85, 86, 87, 88)
    tbody_gyro_columns <- c(123, 124, 125, 126, 127, 128)
    tbody_gyro_jerk_columns <- c(163, 164, 165, 166, 167, 168)
    tbody_acc_mag_columns <- c(203, 204)
    tgravity_acc_mag_columns <- c(216, 217)
    tbody_acc_jerk_mag_columns <- c(229, 230)
    tbody_gyro_mag_columns <- c(242, 243)
    tbody_gyro_jerk_mag_columns <- c(255, 256)
    fbody_acc_columns <- c(268, 269, 270, 271, 272, 273)
    fbody_acc_jerk_columns <- c(347, 348, 349, 350, 351, 352)
    fbody_gyro_columns <- c(426, 427, 428, 429, 430, 431)
    fbody_acc_mag_columns <- c(505, 506)
    fbody_acc_jerk_mag_columns <- c(518, 519)
    fbody_gyro_mag_columns <- c(531, 532)
    fbody_gyro_jerk_mag_columns <- c(544, 545)

    # Concatenate all of the integer vectors above into a single
    # integer vector that is 68 integers long that represents all
    # of the measurement columns of data that the instructions asked us
    # to subset out from the raw data set plus the subject column
    # and the activity column.
    mean_std_columns <- c(subject_column, activity_column,
                          tbody_acc_columns, tgravity_acc_columns,
                          tbody_acc_jerk_columns, tbody_gyro_columns,
                          tbody_gyro_jerk_columns, tbody_acc_mag_columns,
                          tgravity_acc_mag_columns, tbody_acc_jerk_mag_columns,
                          tbody_gyro_mag_columns, tbody_gyro_jerk_mag_columns,
                          fbody_acc_columns, fbody_acc_jerk_columns,
                          fbody_gyro_columns, fbody_acc_mag_columns,
                          fbody_acc_jerk_mag_columns, fbody_gyro_mag_columns,
                          fbody_gyro_jerk_mag_columns)
}


rename_data_set_columns <- function(data_set) {

    # This function renames the columns of the given data set with
    # descriptive variable names.  This function enables us to satisfy
    # step 4 of the instructions.  See CodeBook.md for the list of
    # descriptive variable names.
    names(data_set)[1] <- "SubjectId"
    names(data_set)[2] <- "Activity"
    names(data_set)[3] <- "TimeDomainBodyAccelerationXaxisMean"
    names(data_set)[4] <- "TimeDomainBodyAccelerationYaxisMean"
    names(data_set)[5] <- "TimeDomainBodyAccelerationZaxisMean"
    names(data_set)[6] <- "TimeDomainBodyAccelerationXaxisStandardDeviation"
    names(data_set)[7] <- "TimeDomainBodyAccelerationYaxisStandardDeviation"
    names(data_set)[8] <- "TimeDomainBodyAccelerationZaxisStandardDeviation"
    names(data_set)[9] <- "TimeDomainGravityAccelerationXaxisMean"
    names(data_set)[10] <- "TimeDomainGravityAccelerationYaxisMean"
    names(data_set)[11] <- "TimeDomainGravityAccelerationZaxisMean"
    names(data_set)[12] <-
               "TimeDomainGravityAccelerationXaxisStandardDeviation"
    names(data_set)[13] <-
               "TimeDomainGravityAccelerationYaxisStandardDeviation"
    names(data_set)[14] <-
               "TimeDomainGravityAccelerationZaxisStandardDeviation"
    names(data_set)[15] <- "TimeDomainBodyAccelerationJerkXaxisMean"
    names(data_set)[16] <- "TimeDomainBodyAccelerationJerkYaxisMean"
    names(data_set)[17] <- "TimeDomainBodyAccelerationJerkZaxisMean"
    names(data_set)[18] <-
               "TimeDomainBodyAccelerationJerkXaxisStandardDeviation"
    names(data_set)[19] <-
               "TimeDomainBodyAccelerationJerkYaxisStandardDeviation"
    names(data_set)[20] <-
               "TimeDomainBodyAccelerationJerkZaxisStandardDeviation"
    names(data_set)[21] <- "TimeDomainBodyGyroscopeXaxisMean"
    names(data_set)[22] <- "TimeDomainBodyGyroscopeYaxisMean"
    names(data_set)[23] <- "TimeDomainBodyGyroscopeZaxisMean"
    names(data_set)[24] <- "TimeDomainBodyGyroscopeXaxisStandardDeviation"
    names(data_set)[25] <- "TimeDomainBodyGyroscopeYaxisStandardDeviation"
    names(data_set)[26] <- "TimeDomainBodyGyroscopeZaxisStandardDeviation"
    names(data_set)[27] <- "TimeDomainBodyGyroscopeJerkXaxisMean"
    names(data_set)[28] <- "TimeDomainBodyGyroscopeJerkYaxisMean"
    names(data_set)[29] <- "TimeDomainBodyGyroscopeJerkZaxisMean"
    names(data_set)[30] <- "TimeDomainBodyGyroscopeJerkXaxisStandardDeviation"
    names(data_set)[31] <- "TimeDomainBodyGyroscopeJerkYaxisStandardDeviation"
    names(data_set)[32] <- "TimeDomainBodyGyroscopeJerkZaxisStandardDeviation"
    names(data_set)[33] <- "TimeDomainBodyAccelerationMagnitudeMean"
    names(data_set)[34] <-
               "TimeDomainBodyAccelerationMagnitudeStandardDeviation"
    names(data_set)[35] <- "TimeDomainGravityAccelerationMagnitudeMean"
    names(data_set)[36] <-
               "TimeDomainGravityAccelerationMagnitudeStandardDeviation"
    names(data_set)[37] <- "TimeDomainBodyAccelerationJerkMagnitudeMean"
    names(data_set)[38] <-
               "TimeDomainBodyAccelerationJerkMagnitudeStandardDeviation"
    names(data_set)[39] <- "TimeDomainBodyGyroscopeMagnitudeMean"
    names(data_set)[40] <- "TimeDomainBodyGyroscopeMagnitudeStandardDeviation"
    names(data_set)[41] <- "TimeDomainBodyGyroscopeJerkMagnitudeMean"
    names(data_set)[42] <-
               "TimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation"
    names(data_set)[43] <- "FrequencyDomainBodyAccelerationXaxisMean"
    names(data_set)[44] <- "FrequencyDomainBodyAccelerationYaxisMean"
    names(data_set)[45] <- "FrequencyDomainBodyAccelerationZaxisMean"
    names(data_set)[46] <-
               "FrequencyDomainBodyAccelerationXaxisStandardDeviation"
    names(data_set)[47] <-
               "FrequencyDomainBodyAccelerationYaxisStandardDeviation"
    names(data_set)[48] <-
               "FrequencyDomainBodyAccelerationZaxisStandardDeviation"
    names(data_set)[49] <- "FrequencyDomainBodyAccelerationJerkXaxisMean"
    names(data_set)[50] <- "FrequencyDomainBodyAccelerationJerkYaxisMean"
    names(data_set)[51] <- "FrequencyDomainBodyAccelerationJerkZaxisMean"
    names(data_set)[52] <-
               "FrequencyDomainBodyAccelerationJerkXaxisStandardDeviation"
    names(data_set)[53] <-
               "FrequencyDomainBodyAccelerationJerkYaxisStandardDeviation"
    names(data_set)[54] <-
               "FrequencyDomainBodyAccelerationJerkZaxisStandardDeviation"
    names(data_set)[55] <- "FrequencyDomainBodyGyroscopeXaxisMean"
    names(data_set)[56] <- "FrequencyDomainBodyGyroscopeYaxisMean"
    names(data_set)[57] <- "FrequencyDomainBodyGyroscopeZaxisMean"
    names(data_set)[58] <- "FrequencyDomainBodyGyroscopeXaxisStandardDeviation"
    names(data_set)[59] <- "FrequencyDomainBodyGyroscopeYaxisStandardDeviation"
    names(data_set)[60] <- "FrequencyDomainBodyGyroscopeZaxisStandardDeviation"
    names(data_set)[61] <- "FrequencyDomainBodyAccelerationMagnitudeMean"
    names(data_set)[62] <-
               "FrequencyDomainBodyAccelerationMagnitudeStandardDeviation"
    names(data_set)[63] <- "FrequencyDomainBodyAccelerationJerkMagnitudeMean"
    names(data_set)[64] <-
               "FrequencyDomainBodyAccelerationJerkMagnitudeStandardDeviation"
    names(data_set)[65] <- "FrequencyDomainBodyGyroscopeMagnitudeMean"
    names(data_set)[66] <-
               "FrequencyDomainBodyGyroscopeMagnitudeStandardDeviation"
    names(data_set)[67] <- "FrequencyDomainBodyGyroscopeJerkMagnitudeMean"
    names(data_set)[68] <-
               "FrequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation"

    # Return the data set with the columns renamed.
    data_set
}


average_all_variables <- function(data_set) {

    # In order to construct the second data set as specified in step 5
    # of the instructions, we need to sort / order the data first on the
    # subject ID (the first column) and second on the activity (the second
    # column).  Once the data are ordered, it will be easier to calculate
    # the average of each variable for each activity and each subject.
    ordered_data <- data_set[order(data_set[,1], data_set[,2]),]

    # For each subject and each activity, subset the ordered data to
    # extract the values that need to be averaged.  Then calculate the
    # averages and write those values to the second data set (data frame).
    averages_data_set <- data.frame(value=numeric())
    for (subject in 1:30) {
        walking_data <- subset(ordered_data,
                               SubjectId == subject & Activity == "Walking")
        walking_up_data <- subset(ordered_data,
                                  SubjectId == subject &
                                  Activity == "WalkingUpstairs")
        walking_down_data <- subset(ordered_data,
                                    SubjectId == subject &
                                    Activity == "WalkingDownstairs")
        sitting_data <- subset(ordered_data,
                               SubjectId == subject & Activity == "Sitting")
        standing_data <- subset(ordered_data,
                                SubjectId == subject & Activity == "Standing")
        lying_down_data <- subset(ordered_data,
                                  SubjectId == subject &
                                  Activity == "LyingDown")

        # In order to use "colMeans", we need to get rid of the first two
        # columns of data (the subject ID and the activity).
        walking_data[[2]] <- NULL
        walking_data[[1]] <- NULL
        walking_up_data[[2]] <- NULL
        walking_up_data[[1]] <- NULL
        walking_down_data[[2]] <- NULL
        walking_down_data[[1]] <- NULL
        sitting_data[[2]] <- NULL
        sitting_data[[1]] <- NULL
        standing_data[[2]] <- NULL
        standing_data[[1]] <- NULL
        lying_down_data[[2]] <- NULL
        lying_down_data[[1]] <- NULL

        # Now that we have the correct subset of data, calculate the
        # means of all of the values with "colMeans".
        walking_means <- colMeans(walking_data)
        walking_up_means <- colMeans(walking_up_data)
        walking_down_means <- colMeans(walking_down_data)
        sitting_means <- colMeans(sitting_data)
        standing_means <- colMeans(standing_data)
        lying_down_means <- colMeans(lying_down_data)

        # Since "colMeans" changes our data frame into a numeric vector,
        # we need to change our set of means back to data frames in order
        # to be able to use "cbind" later in this function.  First, change
        # the vector returned by "colMeans" to a row vector, and then
        # change the row vector to a data frame.
        walking_means <- rbind(walking_means)
        walking_means <- data.frame(walking_means)
        walking_means <- data.frame(walking_means)
        walking_up_means <- rbind(walking_up_means)
        walking_up_means <- data.frame(walking_up_means)
        walking_down_means <- rbind(walking_down_means)
        walking_down_means <- data.frame(walking_down_means)
        sitting_means <- rbind(sitting_means)
        sitting_means <- data.frame(sitting_means)
        standing_means <- rbind(standing_means)
        standing_means <- data.frame(standing_means)
        lying_down_means <- rbind(lying_down_means)
        lying_down_means <- data.frame(lying_down_means)

        # We need the subject and the activity in the first two columns
        # so that we can associate the correct set of means from above
        # with the correct subject and activity.
        subject_activity_walking_means <-
                cbind(subject, "Walking", walking_means)
        subject_activity_walking_up_means <-
                cbind(subject, "WalkingUpstairs", walking_up_means)
        subject_activity_walking_down_means <-
                cbind(subject, "WalkingDownstairs", walking_down_means)
        subject_activity_sitting_means <-
                cbind(subject, "Sitting", sitting_means)
        subject_activity_standing_means <-
                cbind(subject, "Standing", standing_means)
        subject_activity_lying_down_means <-
                cbind(subject, "LyingDown", lying_down_means)

        # And we need to rename all of the columns to be the same as they
        # were in the original (first) tidy data set so that we will be
        # able to combine the rows below.
        subject_activity_walking_means <-
                rename_data_set_columns(subject_activity_walking_means)
        subject_activity_walking_up_means <-
                rename_data_set_columns(subject_activity_walking_up_means)
        subject_activity_walking_down_means <-
                rename_data_set_columns(subject_activity_walking_down_means)
        subject_activity_sitting_means <-
                rename_data_set_columns(subject_activity_sitting_means)
        subject_activity_standing_means <-
                rename_data_set_columns(subject_activity_standing_means)
        subject_activity_lying_down_means <-
                rename_data_set_columns(subject_activity_lying_down_means)

        # Write out the subject / activity / means to the second data set.
        averages_data_set <- rbind(averages_data_set,
                                   subject_activity_walking_means,
                                   subject_activity_walking_up_means,
                                   subject_activity_walking_down_means,
                                   subject_activity_sitting_means,
                                   subject_activity_standing_means,
                                   subject_activity_lying_down_means)
    }

    # The "averages_data_set" now contains
    # 180 rows (30 subjects x 6 activities per subject) and 68 columns
    # with the average of each variable for each activity and each
    # subject as specified in step 5 of the instructions.
    averages_data_set
}


create_tidy_data <- function() {

    # This function is the "main" function in this file.  It contains
    # calls (directly or indirectly) to all of the other functions that
    # have been previously defined in this file.  The result of calling
    # this function (which takes no parameters) is that the two tidy
    # data sets specified in the project instructions will be created.

    # Step 1 of the instructions says to merge the training and test
    # sets to create one data set.  So we first have to read the training
    # data set and then read the test data set.

    # Note that it is assumed that the user of this script has unzipped
    # the data Zip file specified in the project instructions in the
    # subdirectory named "data" and has renamed the "UCI HAR Dataset"
    # directory (in "data") to "UciHarDataset" (because it is a nuisance
    # to manipulate file or directory names that contain embedded spaces.
    parent_dir <- './data/UciHarDataset'
    training_data <- read_training_test_data(parent_dir, TRUE)
    test_data <- read_training_test_data(parent_dir, FALSE)

    # Note that our training and test data sets thus far contain only
    # the measurement data and not the activity or the subject.  We
    # will now read in the subject identifiers and the activity
    # identifiers for both the training and test data sets.
    training_subject_data <- read_training_test_subject_data(parent_dir, TRUE)
    training_activity_data <- read_training_test_activity_data(parent_dir, TRUE)
    test_subject_data <- read_training_test_subject_data(parent_dir, FALSE)
    test_activity_data <- read_training_test_activity_data(parent_dir, FALSE)

    # Because of the method that we used to read in the subject data,
    # the subject data are a vector while the other data are data frames,
    # so we are going to create a data frame for the subject data from
    # the subject data vector.
    training_subject_data <- data.frame(training_subject_data)
    test_subject_data <- data.frame(test_subject_data)

    # We have to rename the column names created for the subject data
    # frames that we just created or else the rbind call below will fail.
    colnames(training_subject_data) <- c("subject_id")
    colnames(test_subject_data) <- c("subject_id")

    # Now we can use cbind to append the measurement data to the subject
    # and activity data.  We will do this for both the training and the
    # test data sets.  All of the data being combined are data frames,
    # and the resulting data sets are both still data frames.
    training_all_data <- cbind(training_subject_data, training_activity_data,
                               training_data)
    test_all_data <- cbind(test_subject_data, test_activity_data, test_data)

    # Now we can use rbind to append the test data (a data frame) to the
    # end of the training data (also a data frame).  The resulting data
    # set is still a data frame.
    training_and_test_data <- rbind(training_all_data, test_all_data)

    # That takes care of step 1 of the instructions.

    # Next, step 2 of the instructions says to extract only the
    # measurements on the mean and standard deviation for each
    # measurement in the raw data set.  See the Code Book (CodeBook.md)
    # for a detailed description of the 66 columns from the raw data set
    # that represent mean and standard deviation values.

    # Create an integer vector that contains the column numbers (indexes)
    # for the 66 mean and standard deviation values described in CodeBook.md
    # as well as for the subject and activity values.  So that is 68 columns
    # in total.  Note that all of the measurement column values have to be
    # offset by 2 because of the subject and activity columns that we
    # prepended earlier.
    mean_std_integer_vector <- create_mean_std_integer_vector()

    # Use the integer vector to select all of the rows from the
    # combined training and test data set for the desired 68 columns.
    # The resulting data set will have the same number of rows as
    # the training and test data set (10,299) and will have 68 columns.
    mean_std_data_set <- training_and_test_data[,mean_std_integer_vector]

    # That takes care of step 2 of the instructions.

    # Next, step 3 of the instructions says to use descriptive activity
    # names to name the activities in the data set.  Currently the
    # activities are numbered (1-6).  We want to convert the column of
    # activities (which is currently numeric) to a factor variable, and
    # then we will assign activity names to the factor levels.
    mean_std_data_set$V1 <- factor(mean_std_data_set$V1)
    levels(mean_std_data_set$V1) <- c("Walking", "WalkingUpstairs",
                                      "WalkingDownstairs", "Sitting",
                                      "Standing", "LyingDown")

    # That takes care of step 3 of the instructions.

    # Next, step 4 of the instructions says to label the data set with
    # descriptive variable names.  See CodeBook.md for the list of
    # descriptive variable names.
    mean_std_data_set <- rename_data_set_columns(mean_std_data_set)

    # That takes care of step 4 of the instructions.

    # Lastly, step 5 of the instructions says to create a second,
    # independent tidy data set from the data set in step 4.
    # This second data set should have the average of each variable
    # for each activity and each subject.
    second_data_set <- average_all_variables(mean_std_data_set)

    # That takes care of step 5 of the instructions - the final step.

    # Actually, the final step is to write the tidy data set from step 5
    # out to a text file using the "write.table()" function.
    write.table(second_data_set, file = "second_tidy_data_set.txt",
                row.names = FALSE)
}
