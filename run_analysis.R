### --- project script --- ###


# --- set up data


label <- read.csv("activity_labels.txt", sep="", col.names=c("id","lb"),header=FALSE)


clabel <- read.table("features.txt", sep="", col.names=c("ccod","clb"), header=FALSE)


testx <- read.csv("./test/X_test.txt",sep="", header=FALSE)
testy <- read.csv("./test/y_test.txt",sep="", col.names=c("idlb"),header=FALSE)

trainx <- read.csv("./train/X_train.txt", sep="", header=FALSE)
trainy <- read.csv("./train/y_train.txt", sep="", col.names=c("idlb"), header=FALSE)

label[,2] <- sapply(label[,2], as.character)
clabel[,2]<- sapply(clabel[,2], as.character)

#----MERGING-----

#-- creating id variables

testx["id"]<- seq(1,2947)
testy["id"]<- seq(1,2947)


test <- merge(testx,testy,by="id")

library(sqldf)
testt <- sqldf("select * from test left join label on test.idlb = label.id")

       #---creating id in traint dataset and merging train dataset

trainx["id"]<-seq(1,7352)
trainy["id"]<-seq(1,7352)

train <- merge(trainx,trainy,by="id")

# ---merging with Activity label 
trainn<- sqldf("select * from train left join label on train.idlb = label.id")

        #---include column names in *testt* and *trainn* based on *clabel*

colnames(testt)[1:561]<-clabel[,2]
colnames(trainn)[1:561]<-clabel[,2]

### ----  creating a merge with the final tables

tt <- testt[,c(1:6,565)]
tn <- trainn[,c(1:6,565)]

tidydata <- merge(tt,tn, all=TRUE)

library("plyr")
tidy.data <- ddply(tidydata, .(lb), numcolwise(sum))

##--- creating colnames and final ajustments
##--- PLEASE COPY from repo flabel.txt file and paste it into work directory before run this
 
flabel<-read.csv("flabel.txt", sep=",", header=TRUE)
flabel[,3]<-sapply(flabel[,3], as.character)
 
colnames(tidy.data)[2:7]<-flabel[,3]
colnames(tidy.data)[1]<-c("Activity")

## --- creating a final independent csv file

write.table(tidy.data, file="tidy-data.csv", sep=",", col.names=TRUE,row.names=FALSE)



###---OBS: IF YOU WANT TO CREATE A TABLE WITH SUMMARIZING BY TEST DATA AND TRAIN DATA IN ONE TABLE RUN THIS FINAL CODE WITHOUT #. 



#         #--- put word "test" in testt dataset and "train" in trainn dataset
# 
# testt["type"]<- rep("test", 2947)
# trainn["type"]<- rep("train", 7352)        
#   
#         #--- subsetting test and train data
# 
# te <- testt[,c(1:6,565,566)]
# tr <- trainn[,c(1:6, 565,566)]
# 
# library(sqldf)
# 
# tidy <- sqldf("select * from te union all select * from tr")
# 
#         #--- summarizing
# 
# 
# library("plyr")
# tab<-ddply(tidy, .(type,lb), numcolwise(sum))
# 
#         #--- final ajustments
#  
# flabel<-read.csv("flabel.txt", sep=",", header=TRUE)
# flabel[,3]<-sapply(flabel[,3], as.character)
# 
# colnames(tab)[3:8]<-flable[,3]
# colnames(tab)[1]<- c("Type")
# colnames(tab)[2]<-c("Activity")
# 
#          #---creation of tidy dataset grouped by type: test or train data.
# write.table(tab, file="tidy-dataset.csv", sep=",", col.names=TRUE,row.names=FALSE)
