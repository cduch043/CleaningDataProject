#initialize needed libraries
library(data.table)
library(plyr)
library(dplyr)

#Assumes that the samsung data is in its original directory structure (i.e. test and train directories)
#in the set working directory


##Read test dataset
test<-fread("test/X_test.txt", sep = " ")
#Read the subject list
subT<-fread("test/subject_test.txt", sep = " ")
#Read the activity definitions
act<-fread("test/y_test.txt", sep = " ")
#Add the subject identifers and activity identifiers to the test dataframe
test$subject<-subT$V1
test$activity<-act$V1

#Read the variables names
vars<-fread("features.txt", sep = " ")

#varaible names
names(test)<-c(vars$V2,"subject_id","activity_id")


##Read training dataset
train<-fread("train/X_train.txt", sep = " ")
#Read the training subject identifiers
sub<-fread("train/subject_train.txt", sep = " ")
#Read the training activity names
ac<-fread("train/y_train.txt", sep = " ")
#Add the subject identifiers and activity name to the training dataset
train$subject<-sub$V1
train$activity<-ac$V1

#Read the varaible names in
vars<-fread("features.txt", sep = " ")

#varaible names
names(train)<-c(vars$V2,"subject_id","activity_id")

#Merge the test and train data
merged<-rbind(test,train)


# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#Find the variables indeceswith mean and std - keep only these ones
#As defined in the readme:
#mean(): Mean value
#std(): Standard deviation
col<-grep("mean()|std()|subject_id|activity_id",names(merged))

#Filter for only mean and std columns
subd <- subset(merged, select = c(col))

#Reorder columns to put subject ID and activity at the front
subd <- subset(subd, select = c(80,81,1:79))


#Set Activity names
#1 = WALKING
#2 = WALKING_UPSTAIRS
#3 = WALKING_DOWNSTAIRS
#4 = SITTING
#5 = STANDING
#6 = LAYING

#3 Uses descriptive activity names to name the activities in the data set
desc<-subd
desc$activity_id[subd$activity_id == "1"] <- "WALKING"
desc$activity_id[subd$activity_id == "2"] <- "WALKING_UPSTAIRS"
desc$activity_id[subd$activity_id == "3"] <- "WALKING_DOWNSTAIRS"
desc$activity_id[subd$activity_id == "4"] <- "SITTING"
desc$activity_id[subd$activity_id == "5"] <- "STANDING"
desc$activity_id[subd$activity_id == "6"] <- "LAYING"



#4.Appropriately labels the data set with descriptive variable names.
#Use plyr's rename function for each variable to set an appropriate name
ren <-desc
ren <- plyr::rename(ren, c("subject_id" = "SubjectID"))
ren <- plyr::rename(ren, c("activity_id" = "Activity"))
ren<- plyr::rename(ren, c("tBodyAcc-mean()-X" ="tBodyAccMeanXAxis"))
ren<- plyr::rename(ren, c("tBodyAcc-mean()-Y" ="tBodyAccMeanYAxis"))
ren<- plyr::rename(ren, c("tBodyAcc-mean()-Z" ="tBodyAccMeanZAxis"))
ren <- plyr::rename(ren,c("tBodyAcc-std()-X" ="tBodyAccSDevXAxis"))
ren <- plyr::rename(ren,c("tBodyAcc-std()-Y" ="tBodyAccSDevYAxis"))
ren <- plyr::rename(ren,c("tBodyAcc-std()-Z" ="tBodyAccSDevZAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-mean()-X" ="tGravityAccMeanXAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-mean()-Y" ="tGravityAccMeanYAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-mean()-Z" ="tGravityAccMeanZAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-std()-X" ="tGravityAccSDevXAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-std()-Y" ="tGravityAccSDevYAxis"))
ren <- plyr::rename(ren,c("tGravityAcc-std()-Z" ="tGravityAccSDevZAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-mean()-X" ="tBodyAccJerkMeanXAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-mean()-Y" ="tBodyAccJerkMeanYAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-mean()-Z" ="tBodyAccJerkMeanZAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-std()-X" ="tBodyAccJerkSDevXAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-std()-Y" ="tBodyAccJerkSDevYAxis"))
ren <- plyr::rename(ren,c("tBodyAccJerk-std()-Z" ="tBodyAccJerkSDevZAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-mean()-X" ="tBodyGyroMeanXAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-mean()-Y" ="tBodyGyroMeanYAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-mean()-Z" ="tBodyGyroMeanZAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-std()-X" ="tBodyGyroSDevXAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-std()-Y" ="tBodyGyroSDevYAxis"))
ren <- plyr::rename(ren,c("tBodyGyro-std()-Z" ="tBodyGyroSDevZAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-mean()-X" ="tBodyGyroJerkMeanXAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-mean()-Y" ="tBodyGyroJerkMeanYAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-mean()-Z" ="tBodyGyroJerkMeanZAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-std()-X" ="tBodyGyroJerkSDevXAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-std()-Y" ="tBodyGyroJerkSDevYAxis"))
ren <- plyr::rename(ren,c("tBodyGyroJerk-std()-Z" ="tBodyGyroJerkSDevZAxis"))
ren <- plyr::rename(ren,c("tBodyAccMag-mean()" ="tBodyAccMagMean"))
ren <- plyr::rename(ren,c("tBodyAccMag-std()" ="tBodyAccMagSDev"))
ren <- plyr::rename(ren,c("tGravityAccMag-mean()" ="tGravityAccMagMean"))
ren <- plyr::rename(ren,c("tGravityAccMag-std()"="tGravityAccMagSDev"))
ren <- plyr::rename(ren,c("tBodyAccJerkMag-mean()" ="tBodyAccJerkMagMean"))
ren <- plyr::rename(ren,c("tBodyAccJerkMag-std()" ="tBodyAccJerkMagSDev"))
ren <- plyr::rename(ren,c("tBodyGyroMag-mean()" ="tBodyGyroMagMean"))
ren <- plyr::rename(ren,c("tBodyGyroMag-std()" ="tBodyGyroMagSDev"))
ren <- plyr::rename(ren,c("tBodyGyroJerkMag-mean()" ="tBodyGyroJerkMagMean"))
ren <- plyr::rename(ren,c("tBodyGyroJerkMag-std()" ="tBodyGyroJerkMagSDev"))
ren <- plyr::rename(ren,c("fBodyAcc-mean()-X" ="fBodyAccMeanXAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-mean()-Y" ="fBodyAccMeanYAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-mean()-Z" ="fBodyAccMeanZAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-std()-X" ="fBodyAccSDevXAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-std()-Y" ="fBodyAccSDevYAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-std()-Z" ="fBodyAccSDevZAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-meanFreq()-X" ="fBodyAccMeanFreqXAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-meanFreq()-Y" ="fBodyAccMeanFreqYAxis"))
ren <- plyr::rename(ren,c("fBodyAcc-meanFreq()-Z" ="fBodyAccMeanFreqZAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-mean()-X" ="fBodyAccJerkMeanXAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-mean()-Y" ="fBodyAccJerkMeanYAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-mean()-Z" ="fBodyAccJerkMeanZAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-std()-X" ="fBodyAccJerkSDevXAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-std()-Y" ="fBodyAccJerkSDevYAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-std()-Z" ="fBodyAccJerkSDevZAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-meanFreq()-X" ="fBodyAccJerkMeanFreqXAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-meanFreq()-Y" ="fBodyAccJerkMeanFreqYAxis"))
ren <- plyr::rename(ren,c("fBodyAccJerk-meanFreq()-Z" ="fBodyAccJerkMeanFreqZAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-mean()-X" ="fBodyGyroMeanXAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-mean()-Y" ="fBodyGyroMeanYAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-mean()-Z" ="fBodyGyroMeanZAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-std()-X" ="fBodyGyroSDevXAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-std()-Y" ="fBodyGyroSDevYAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-std()-Z" ="fBodyGyroSDevZAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-meanFreq()-X" ="fBodyGyroMeanFreqXAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-meanFreq()-Y" ="fBodyGyroMeanFreqYAxis"))
ren <- plyr::rename(ren,c("fBodyGyro-meanFreq()-Z" ="fBodyGyroMeanFreqZAxis"))
ren <- plyr::rename(ren,c("fBodyAccMag-mean()" ="fBodyAccMagMean"))
ren <- plyr::rename(ren,c("fBodyAccMag-std()" ="fBodyAccMagSDev"))
ren <- plyr::rename(ren,c("fBodyAccMag-meanFreq()" ="fBodyAccMagMeanFreq"))
ren <- plyr::rename(ren,c("fBodyBodyAccJerkMag-mean()" ="fBodyBodyAccJerkMagMean"))
ren <- plyr::rename(ren,c("fBodyBodyAccJerkMag-std()" ="fBodyBodyAccJerkMagSDev"))
ren <- plyr::rename(ren,c("fBodyBodyAccJerkMag-meanFreq()" ="fBodyBodyAccJerkMagMeanFreq"))
ren <- plyr::rename(ren,c("fBodyBodyGyroMag-mean()" ="fBodyBodyGyroMagMean"))
ren <- plyr::rename(ren,c("fBodyBodyGyroMag-std()" ="fBodyBodyGyroMagSDev"))
ren <- plyr::rename(ren,c("fBodyBodyGyroMag-meanFreq()" ="fBodyBodyGyroMagMeanFreq"))
ren <- plyr::rename(ren,c("fBodyBodyGyroJerkMag-mean()" ="fBodyBodyGyroJerkMagMean"))
ren <- plyr::rename(ren,c("fBodyBodyGyroJerkMag-std()" ="fBodyBodyGyroJerkMagSDev"))
ren <- plyr::rename(ren,c("fBodyBodyGyroJerkMag-meanFreq()" ="fBodyBodyGyroJerkMagMeanFreq"))


#5. From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.
#1 = WALKING
#2 = WALKING_UPSTAIRS
#3 = WALKING_DOWNSTAIRS
#4 = SITTING
#5 = STANDING
#6 = LAYING


walking<-ren[ren$Activity=="WALKING"]
walking_u<-ren[ren$Activity=="WALKING_UPSTAIRS"]
walking_d<-ren[ren$Activity=="WALKING_DOWNSTAIRS"]
sitting<-ren[ren$Activity=="SITTING"]
standing<-ren[ren$Activity=="STANDING"]
laying<-ren[ren$Activity=="LAYING"]

#Split the datasets into each activity for more processing
walking<-walking[order(walking$SubjectID)]
walking_u<-walking_u[order(walking_u$SubjectID)]
walking_d<-walking_d[order(walking_d$SubjectID)]
sitting<-sitting[order(sitting$SubjectID)]
standing<-standing[order(standing$SubjectID)]
laying<-laying[order(laying$SubjectID)]

#Ensure they are all ordered by subjectID
walking<-walking[order(walking$SubjectID),]
walking_u<-walking_u[order(walking_u$SubjectID),]
walking_d<-walking_d[order(walking_d$SubjectID),]
sitting<-sitting[order(sitting$SubjectID),]
standing<-standing[order(standing$SubjectID),]
laying<-laying[order(laying$SubjectID),]

#Convert back to data.frame (we don't want data.tables)
walking<-as.data.frame(walking)
walking_u<-as.data.frame(walking_u)
walking_d<-as.data.frame(walking_d)
sitting<-as.data.frame(sitting)
standing<-as.data.frame(standing)
laying<-as.data.frame(laying)

#Set subject Numbers
av<-1:30


#WALKING
avw<-av
avw<-cbind(avw,walking$Activity[1:30])
avw<-as.data.frame(avw)
for (i in 3:length(names(walking))){
  
  tmp<-tapply(walking[,i],walking[,1],mean)
  avw<-cbind(avw,tmp)
  colnames(avw)[i] <- paste(names(walking)[i],"-AVG",sep = "")
  avw[,i]<-as.numeric(avw[,i])
}

#WALKING UPSTAIRS
avwu<-av
avwu<-cbind(avwu,walking_u$Activity[1:30])
avwu<-as.data.frame(avwu)
for (i in 3:length(names(walking_u))){
  
  tmp<-tapply(walking_u[,i],walking_u[,1],mean)
  avwu<-cbind(avwu,tmp)
  colnames(avwu)[i] <- paste(names(walking_u)[i],"-AVG",sep = "")
  avwu[,i]<-as.numeric(avwu[,i])
}


#WALKING DOWNSTAIRS
avwd<-av
avwd<-cbind(avwd,walking_d$Activity[1:30])
avwd<-as.data.frame(avwd)
for (i in 3:length(names(walking_d))){
  
  tmp<-tapply(walking_d[,i],walking_d[,1],mean)
  avwd<-cbind(avwd,tmp)
  colnames(avwd)[i] <- paste(names(walking_d)[i],"-AVG",sep = "")
  avwd[,i]<-as.numeric(avwd[,i])
}

#SITTING
avs<-av
avs<-cbind(avs,walking$Activity[1:30])
avs<-as.data.frame(avs)
for (i in 3:length(names(sitting))){
  
  tmp<-tapply(sitting[,i],sitting[,1],mean)
  avs<-cbind(avs,tmp)
  colnames(avs)[i] <- paste(names(sitting)[i],"-AVG",sep = "")
  avs[,i]<-as.numeric(avs[,i])
}

#STANDING
avst<-av
avst<-cbind(avst,standing$Activity[1:30])
avst<-as.data.frame(avst)
for (i in 3:length(names(standing))){
  
  tmp<-tapply(standing[,i],standing[,1],mean)
  avst<-cbind(avst,tmp)
  colnames(avst)[i] <- paste(names(standing)[i],"-AVG",sep = "")
  avst[,i]<-as.numeric(avst[,i])
}

#LAYING
avl<-av
avl<-cbind(avl,laying$Activity[1:30])
avl<-as.data.frame(avl)
for (i in 3:length(names(laying))){
  
  tmp<-tapply(laying[,i],laying[,1],mean)
  avl<-cbind(avl,tmp)
  colnames(avl)[i] <- paste(names(laying)[i],"-AVG",sep = "")
  avl[,i]<-as.numeric(avl[,i])
}

#Set the variable names so that they can be merged
colnames(avw)[1] <- "SubjectID"
colnames(avwu)[1] <- "SubjectID"
colnames(avwd)[1] <- "SubjectID"
colnames(avs)[1] <- "SubjectID"
colnames(avst)[1] <- "SubjectID"
colnames(avl)[1] <- "SubjectID"

#merge each of the activity specific datasets into one final dataset
final<-rbind(avw,avwu)
final<-rbind(final,avwd)
final<-rbind(final,avs)
final<-rbind(final,avst)
final<-rbind(final,avl)

#Set the activity column name
colnames(final)[2] <- "Activity"

final$SubjectID<-as.numeric(final$SubjectID)

#Write the final table
write.table(final, "Final.txt", row.names = F)

