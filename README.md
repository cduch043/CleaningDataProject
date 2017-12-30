Source Dataset by:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


Modified and updated:
==================================================================
by Chris Ducharme 12-30-2017

Description of experiments:
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

This is a summarized dataset. For each record, the following is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, averaged for each participant for each activity.
- Triaxial Angular velocity from the gyroscope, averaged for each participant for each activity.
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The following files are included:
=========================================

- 'README.txt'

- 'codebook.txt': Shows information about the variables used.

- 'variables.xlsx': a description of each variable included in the dataset.

- 'Dataset.txt': aditional high level dataset information and instructions to reproduce the final dataset

- 'run_analysis.R': an all inclusive R script that creates the desired dataset

Script documentation and instructions:
=========================================

The script run_analysis.R can be run in any current version of R, provided the required libraries (data.table and dplyr) are installed and available.
The scripts is a single file broken down into section based on the assignment requirements. Each section depends on the previous executing successfully and so the script must be run as a whole.

Step 1: Open the script and set the working directory to that of the top level of the dataset (the UCI HAR Dataset directory). There should be a 'test' and 'train' directories with the associated datasets present here.

Step 2: Execute the entire R script run_analysis.R

Step 3: A file titled ‘Final.txt’ will be output as the desired dataset.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file as the average taken by subject by activity
- Each participant conducted each activity multiple times, the avaerage of the measurements over each activity is included in this dataset