## Overview
The web page describing the experiment that produced the raw data
for this project is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This web page describes the data set information.  Also, there is a
link at the top of this web page to the raw data (stored as a Zip file).
If you unzip the Zip file, you will see the following files at the top
level as follows:

## Description of the files in the raw data set
README.txt - a description of the experiment, similar to what is on the
web page listed above, but with more detail.  Also, this README.txt file
contains brief descriptions of the other files provided in the Zip package.

activity_labels.txt - a six line file that maps the six low to moderate
intensity activities to the numerical values (1-6) used to represent
them in the raw data.  Note that the sixth activity is incorrectly
described as "LAYING" when it should instead be described as
"LYING_DOWN" - I have used "LYING_DOWN" in the tidy data set.

features_info.txt - a description of the signals and the naming
conventions used in the raw data.

features.txt - a 561 line long file that contains the names of all of
the 561 values in the raw data (561 values for each of the six
activities for each of the 30 subjects in the experiment).

The rest of this Code Book assumes that you have read the above files.

## Description of the raw data (based on the documentation provided)
The raw data set consists of 561 columns of values - both measurements
and derived values from measurements - from the recordings of 30 human
subjects performing six types of low to moderate intensity activities.
The subjects carried / wore waist-mounted smartphones with embedded
inertial sensors (an accelerometer and a gyroscope).

The raw signals consist of time domain (captured at 50 Hz) accelerometer
(acceleration) signals along three axes (three dimensions) and gyroscope
signals along three axes (three dimensions).

The instructions for this project asked us to create a tidy data
set (subset) of 66 variables from the 561 variables in the raw data set
(approximately 12%).  The 66 tidy data variables consist of 40 time domain
variables and 26 frequency domain variables as described below.

Note that all of the variables in the raw data set were not sufficiently
descriptive, so I have renamed them in the tidy data set as described below.

The acceleration signals were separated into those attributable to
gravity and those attributable to the movement of the subjects ("body").
The acceleration attributable to the movement of the subjects is
called "tBodyAcc" in the raw data set.  The acceleration attributable
to gravity is called "tGravityAcc" in the raw data set.  I have renamed
these two sets of variables as "TimeDomainBodyAcceleration" and
"TimeDomainGravityAcceleration".

The linear accleration (from the accelerometer) was derived in time to
obtain "Jerk" signals.  The acceleration attributable to the movement
of the subjects (tBodyAcc) derived in time is called "tBodyAccJerk"
in the raw data set.  I have renamed this variable as
"TimeDomainBodyAccelerationJerk".

The angular velocity (from the gyroscope) is called "tBodyGyro" in
the raw data set.  The angular velocity was derived in time to obtain
"Jerk" signals.  The angular velocity derived in time is called
"tBodyGyroJerk" in the raw data set.  I have renamed "tBodyGyro" as
"TimeDomainBodyGyroscope" and have renamed "tBodyGyroJerk" as
"TimeDomainBodyGyroscopeJerk".

The magnitude of the acceleration attributable to the movement of the
subjects is called "tBodyAccMag" in the raw data set.  I have renamed
this variable as "TimeDomainBodyAccelerationMagnitude".

The magnitude of the acceleration attributable to gravity is called
"tGravityAccMag" in the raw data set.  I have renamed this variable
as "TimeDomainGravityAccelerationMagnitude".

The magnitude of the acceleration attributable to the movement of the
subjects derived in time is called "tBodyAccJerkMag" in the raw data set.
I have renamed this variable as "TimeDomainBodyAccelerationJerkMagnitude".

The magnitude of the angular velocity (from the gyroscope) is called
"tBodyGyroMag" in the raw data set.  I have renamed this variable as
"TimeDomainBodyGyroscopeMagnitude".

The magnitude of the angular velocity (from the gyroscope) derived in
time is called "tBodyGyroJerkMag" in the raw data set.  I have renamed
this variable as "TimeDomainBodyGyroscopeJerkMagnitude".

The frequency domain variables are all derived values.  A Fast Fourier
Transform (FFT) was applied to some of the signals described above
to produce the 26 variables described below that we were instructed to
include in our tidy data set.

The frequency domain / FFT of the acceleration attributable to the
movement of the subjects is called "fBodyAcc" in the raw data set.
I have renamed this variable as "FrequencyDomainBodyAcceleration".

The frequency domain / FFT of the linear accleration attributable to
the movement of the subjects derived in time is called "fBodyAccJerk"
in the raw data set.  I have renamed this variable as
"FrequencyDomainBodyAccelerationJerk".

The frequency domain / FFT of the angular velocity is called "fBodyGyro"
in the raw data set.  I have renamed this variable as
"FrequencyDomainBodyGyroscope".

The frequency domain / FFT of the magnitude of the acceleration
attributable to the movement of the subjects is called "fBodyAccMag"
in the raw data set.  I have renamed this variable as
"FrequencyDomainBodyAccelerationMagnitude".

The frequency domain / FFT of the magnitude of the acceleration
attributable to the movement of the subjects derived in time is called
"fBodyBodyAccJerkMag" in the raw data set.  Note that the raw data set
variable name has an extra "Body" in its name.  I have renamed this
variable as "FrequencyDomainBodyAccelerationJerkMagnitude".

The frequency domain / FFT of the magnitude of the angular velocity
is called "fBodyBodyGyroMag" in the raw data set.  Note that the raw data
set variable name has an extra "Body" in its name.  I have renamed this
variable as "FrequencyDomainBodyGyroscopeMagnitude".

The frequency domain / FFT of the magnitude of the angular velocity
derived in time is called "fBodyBodyGyroJerkMag" in the raw data set.
Note that the raw data set variable name has an extra "Body" in its name.
I have renamed this variable as "FrequencyDomainBodyGyroscopeJerkMagnitude".

## Mean and Standard Deviation values (subsetted data)
For all of the variables described and named above, we were instructed
to subset out only the mean and standard deviation values (there are
several other types of values in the raw data set.  In the raw data set,
"-mean()" and "-std()" have been appended to the names provided above
to denote the mean and standard deviation values of those variables.
I have renamed "-mean()" as "Mean" and "-std()" as "StandardDeviation".

Also, for those signals that have three axes (dimensions), the
raw data set names have "-X" / "-Y" / "-Z" appended to the variable
names to represent the X-axis, Y-axis, and Z-axis values.  I have
renamed these as "Xaxis", "Yaxis", and "Zaxis".  Also note that while
the raw data set variable names put the "-X" / "-Y" / "-Z" at the ends
of the variable names, I instead put the "Mean" or "StandardDeviation"
component of the name at the end.

## Raw data column numbers and raw data variable numbers for subsetted data
Here are the raw data column numbers and raw data variable names
for the 66 variables that we were instructed to subset out into
the tidy data set:
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()

## Tidy data column numbers and descriptions
And here are the tidy data column numbers and tidy data variable
names for the 66 variables in the tidy data set (they are in the
same order as the raw data variables listed above).  But note that
these column numbers are for the measurement data only.  For the
data sets created in the project code, a subject ID column and an
activity column were prepended, so one should add 2 to all of the
values below to get the actual column numbers used in the project code.
1 TimeDomainBodyAccelerationXaxisMean
2 TimeDomainBodyAccelerationYaxisMean
3 TimeDomainBodyAccelerationZaxisMean
4 TimeDomainBodyAccelerationXaxisStandardDeviation
5 TimeDomainBodyAccelerationYaxisStandardDeviation
6 TimeDomainBodyAccelerationZaxisStandardDeviation
7 TimeDomainGravityAccelerationXaxisMean
8 TimeDomainGravityAccelerationYaxisMean
9 TimeDomainGravityAccelerationZaxisMean
10 TimeDomainGravityAccelerationXaxisStandardDeviation
11 TimeDomainGravityAccelerationYaxisStandardDeviation
12 TimeDomainGravityAccelerationZaxisStandardDeviation
13 TimeDomainBodyAccelerationJerkXaxisMean
14 TimeDomainBodyAccelerationJerkYaxisMean
15 TimeDomainBodyAccelerationJerkZaxisMean
16 TimeDomainBodyAccelerationJerkXaxisStandardDeviation
17 TimeDomainBodyAccelerationJerkYaxisStandardDeviation
18 TimeDomainBodyAccelerationJerkZaxisStandardDeviation
19 TimeDomainBodyGyroscopeXaxisMean
20 TimeDomainBodyGyroscopeYaxisMean
21 TimeDomainBodyGyroscopeZaxisMean
22 TimeDomainBodyGyroscopeXaxisStandardDeviation
23 TimeDomainBodyGyroscopeYaxisStandardDeviation
24 TimeDomainBodyGyroscopeZaxisStandardDeviation
25 TimeDomainBodyGyroscopeJerkXaxisMean
26 TimeDomainBodyGyroscopeJerkYaxisMean
27 TimeDomainBodyGyroscopeJerkZaxisMean
28 TimeDomainBodyGyroscopeJerkXaxisStandardDeviation
29 TimeDomainBodyGyroscopeJerkYaxisStandardDeviation
30 TimeDomainBodyGyroscopeJerkZaxisStandardDeviation
31 TimeDomainBodyAccelerationMagnitudeMean
32 TimeDomainBodyAccelerationMagnitudeStandardDeviation
33 TimeDomainGravityAccelerationMagnitudeMean
34 TimeDomainGravityAccelerationMagnitudeStandardDeviation
35 TimeDomainBodyAccelerationJerkMagnitudeMean
36 TimeDomainBodyAccelerationJerkMagnitudeStandardDeviation
37 TimeDomainBodyGyroscopeMagnitudeMean
38 TimeDomainBodyGyroscopeMagnitudeStandardDeviation
39 TimeDomainBodyGyroscopeJerkMagnitudeMean
40 TimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation
41 FrequencyDomainBodyAccelerationXaxisMean
42 FrequencyDomainBodyAccelerationYaxisMean
43 FrequencyDomainBodyAccelerationZaxisMean
44 FrequencyDomainBodyAccelerationXaxisStandardDeviation
45 FrequencyDomainBodyAccelerationYaxisStandardDeviation
46 FrequencyDomainBodyAccelerationZaxisStandardDeviation
47 FrequencyDomainBodyAccelerationJerkXaxisMean
48 FrequencyDomainBodyAccelerationJerkYaxisMean
49 FrequencyDomainBodyAccelerationJerkZaxisMean
50 FrequencyDomainBodyAccelerationJerkXaxisStandardDeviation
51 FrequencyDomainBodyAccelerationJerkYaxisStandardDeviation
52 FrequencyDomainBodyAccelerationJerkZaxisStandardDeviation
53 FrequencyDomainBodyGyroscopeXaxisMean
54 FrequencyDomainBodyGyroscopeYaxisMean
55 FrequencyDomainBodyGyroscopeZaxisMean
56 FrequencyDomainBodyGyroscopeXaxisStandardDeviation
57 FrequencyDomainBodyGyroscopeYaxisStandardDeviation
58 FrequencyDomainBodyGyroscopeZaxisStandardDeviation
59 FrequencyDomainBodyAccelerationMagnitudeMean
60 FrequencyDomainBodyAccelerationMagnitudeStandardDeviation
61 FrequencyDomainBodyAccelerationJerkMagnitudeMean
62 FrequencyDomainBodyAccelerationJerkMagnitudeStandardDeviation
63 FrequencyDomainBodyGyroscopeMagnitudeMean
64 FrequencyDomainBodyGyroscopeMagnitudeStandardDeviation
65 FrequencyDomainBodyGyroscopeJerkMagnitudeMean
66 FrequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation

## Units
This Code Book is supposed to provide the units for all of the variables
in the tidy data set.  Unfortunately, the description of the raw data
does not mention anything about units, at least nothing that I could find.
In the absence of any discussion about units, I am going to assume that
the units are those in the International System of Units (SI).  Note that
I am going to provide units only for the "XaxisMean" and "MagnitudeMean"
values - the Y-axis and Z-axis units are the same, as are the units ofstandard
deviation.  The column numbers listed are those for the tidy data set.
Also note that Fast Fourier Transforms (FFTs) are a type of
discrete Fourier transform, so the unit stays the same.


1 TimeDomainBodyAccelerationXaxisMean - linear acceleration units
  are meters per second per second (m/s/s or m/s**2)
7 TimeDomainGravityAccelerationXaxisMean - linear acceleration units
  are meters per second per second (m/s/s or m/s**2)
13 TimeDomainBodyAccelerationJerkXaxisMean - this variable is described
   as acceleration derived in time, which should mean another "per second"
   (i.e., velocity derived in time is acceleration - m/s -> m/s/s),
   so the units are meters per second per second per second
   (m/s/s/s or m/s**3)
19 TimeDomainBodyGyroscopeXaxisMean - gyroscopes measure angular velocity;
   SI units for angular velocity are radians per second (rad/s)
25 TimeDomainBodyGyroscopeJerkXaxisMean - this variable is described as
   angular velocity derived in time, which should mean another "per second",
   so the units are radians per second per second (rad/s/s or rad/s**2)
31 TimeDomainBodyAccelerationMagnitudeMean - linear acceleration units
   are meters per second per second (m/s/s or m/s**2)
33 TimeDomainGravityAccelerationMagnitudeMean - linear acceleration units
   are meters per second per second (m/s/s or m/s**2)
35 TimeDomainBodyAccelerationJerkMagnitudeMean - linear acceleration
   derived in time units are meters per second per second per second
   (m/s/s/s or m/s**3)
37 TimeDomainBodyGyroscopeMagnitudeMean - angular velocity units
   are radians per second (rad/s)
39 TimeDomainBodyGyroscopeJerkMagnitudeMean - angular velocity derived
   in time units are radians per second per second (rad/s/s or rad/s**2)
41 FrequencyDomainBodyAccelerationXaxisMean - linear acceleration units
   are meters per second per second (m/s/s or m/s**2)
47 FrequencyDomainBodyAccelerationJerkXaxisMean - linear acceleration
   derived in time units are meters per second per second per second
   (m/s/s/s or m/s**3)
53 FrequencyDomainBodyGyroscopeXaxisMean - angular velocity units
   are radians per second (rad/s)
59 FrequencyDomainBodyAccelerationMagnitudeMean - linear acceleration
   units are meters per second per second (m/s/s or m/s**2)
61 FrequencyDomainBodyAccelerationJerkMagnitudeMean - angular velocity
   derived in time units are radians per second per second
   (rad/s/s or rad/s**2)
63 FrequencyDomainBodyGyroscopeMagnitudeMean - angular velocity units
   are radians per second (rad/s)
65 FrequencyDomainBodyGyroscopeJerkMagnitudeMean - angular velocity
   derived in time units are radians per second per second
   (rad/s/s or rad/s**2)
