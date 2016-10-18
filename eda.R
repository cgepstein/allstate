#################################################################
# set directories, import libraries
#################################################################
library(data.table)
library(Matrix)
library(xgboost)
library(Metrics)
set.seed(2)

data_dir="C:/Users/epsteinc/personal_docs/kaggle_competitions/allstate_claims/data"


#################################################################
# read in data
#################################################################

train=read.csv(paste(data_dir, "train.csv", sep="/"))
test=read.csv(paste(data_dir, "test.csv", sep="/"))

all_dat=rbind(train, cbind(test, loss=NA))

#################################################################
# one hot encoding on categorical vars
#################################################################

id=all_dat$id
cat=all_dat[,which(grepl("cat",names(all_dat))==T)]
cont=all_dat[,which(grepl("cont",names(all_dat))==T)]
loss=all_dat$loss

