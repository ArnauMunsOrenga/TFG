library(quantmod)
library(TTR)
library(lubridate)
library(dplyr)
library(car)
library(caret)
library(randomForest)
library(tfestimators)
library(modelr)

options(repos = c(CRAN = "http://cran.rstudio.com"))


getSymbols(Symbols = "AAPL",src = "av",
              api.key = "Q5UC0SVY5BZJVWLZ",
              return.class = "xts",
              periodicity = "intraday",
              interval = "1min",
              output.size = "full",
              data.type = "csv")



#getting data
getSymbols(Symbols = "AAPL", from ="2000-01-01",to="2017-12-31")
#getSymbols(Symbols = "KHC", from ="2000-01-01",to="2017-12-31")
getSymbols(Symbols = "WFC", from ="2000-01-01",to="2017-12-31")
getSymbols(Symbols = "BAC", from ="2000-01-01",to="2017-12-31")
getSymbols(Symbols = "KO", from ="2000-01-01",to="2017-12-31")
getSymbols(Symbols = "SNY", from ="2000-01-01",to="2017-12-31")


#ploting stock price
chartSeries(AAPL)
chartSeries(KO)
chartSeries(BAC)
chartSeries(WFC)

#leaving xts format
prices<-as.data.frame(WFC)

#create target variable. we want to predict whether the stock price of tomorrow is going to be upper or lower
target<-c()
for(i in 2:(nrow(WFC))){
  if(as.numeric(WFC[i,4])>as.numeric(WFC[i-1,4])){
    target[i]<-"Up"
  }else{
    target[i]<-"Down"
  }
}

#version2 prob good

target<-c()
for(i in 1:(nrow(WFC)-1)){
  if(as.numeric(WFC[i+1,4])>as.numeric(WFC[i,4])){
    target[i]<-"Up"
  }else{
    target[i]<-"Down"
  }
}

target<-c()
for(i in 1:(nrow(WFC)-10)){
  if(as.numeric(WFC[i+10,4])>as.numeric(WFC[i,4])){
    target[i]<-"Up"
  }else{
    target[i]<-"Down"
  }
}

target<-c()
for(i in 1:(nrow(WFC)-20)){
  if(as.numeric(WFC[i+20,4])>as.numeric(WFC[i,4])){
    target[i]<-"Up"
  }else{
    target[i]<-"Down"
  }
}

data<-cbind(prices[-nrow(prices),],target)
data<-cbind(prices[-c((nrow(prices)-9):nrow(prices)),],target)
data<-cbind(prices[-c((nrow(prices)-19):nrow(prices)),],target)
data<-cbind(prices,target)
#data<-data[-1,]
data$target<-factor(data$target)


#let's build our technical indicators
data<-data %>% 
  
  #Aroon
  cbind(aroon(data[,c("WFC.High","WFC.Low")],20)) %>% 
  
  #----------------------------------------
  
  #Simple moving average 10 day
  cbind(sma10=SMA(data[,"WFC.Close"],10)) %>% 
  
  #----------------------------------------
  
  #exponential moving average 10 day
  cbind(ema10=EMA(data[,"WFC.Close"],10)) %>% 
  
  #----------------------------------------
  
  #momentum 1 day
  cbind(mom1=momentum(data[,"WFC.Close"],1)) %>%
  cbind(mom2=momentum(data[,"WFC.Close"],2)) %>%
  cbind(mom3=momentum(data[,"WFC.Close"],3)) %>%
  cbind(mom4=momentum(data[,"WFC.Close"],4)) %>%
  cbind(mom5=momentum(data[,"WFC.Close"],5)) %>%
  
  #momentum 9 day
  cbind(mom9=momentum(data[,"WFC.Close"],9)) %>%
  
  cbind(mom15=momentum(data[,"WFC.Close"],15)) %>%
  
  #----------------------------------------

  #Rate of change 1 day
  cbind(ROC1=ROC(data[,"WFC.Close"],1)) %>%
  
  #Rate of change 9 day
  cbind(ROC9=ROC(data[,"WFC.Close"],9)) %>%

  #----------------------------------------

  #fastK%, fastD% and slowD%
#nFastK = 14, nFastD = 3, nSlowD = 3
  cbind(data.frame(stoch(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")])))) %>% 

  #SMI
  #n = 13, nFast = 2, nSlow = 25
  cbind(SMI=data.frame(SMI(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")])))[,1]) %>% 
  
  #----------------------------------------
    
  #RSI
  cbind(RSI=RSI(data[,"WFC.Close"])) %>% 

  #----------------------------------------

  #Williams Accumulation/Distribution
  cbind(data.frame(wAD=williamsAD(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")])))) %>% 
  
  #Williams Percentage range
  cbind(data.frame(WPR(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")]))))

  #names(data)[23]<-"WPR"
names(data)[28]<-"WPR"
  #----------------------------------------

  data<-data %>% 
  #Moving Average convergence divergence
  cbind(macd=MACD(data[,"WFC.Close"],12, 26, 9, maType="EMA" )[,1]) %>% 
  
  #----------------------------------------
  
  #Comodity Channel Index
  cbind(data.frame(CCI=CCI(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")])))) %>% 
  
  #----------------------------------------

  #On Balance Volume
  cbind(OBV=OBV(data[,"WFC.Close"],data[,"WFC.Volume"])) %>% 
  
  #----------------------------------------
  
  #Average true range, true range1 and true range2
  cbind(data.frame(ATR(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")])))) 
  
  b3<-data.frame(tr2=((data[,4]-data$trueLow)/(data$trueHigh-data$trueLow)))
  
  data<-data %>% 
    cbind(b3) %>% 
  
  select(-c(trueHigh,trueLow)) %>% 
    
  #----------------------------------------
  
  #Trend detection index, using both TDI and DI
  cbind(TDI(data[,"WFC.Close"])) %>% 
    
  #ADX and DX and DIp/DIn
  cbind(data.frame(ADX(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")]),20)))
  
  b2<-data.frame(PNratio=data$DIp/data$DIn) 
  
  data<-data %>% 
    cbind(b2) %>% 
  
  select(-c(DIp,DIn)) %>% 
    
  #Bollinger band width
  cbind(data.frame(BBands(as.xts(data[,c("WFC.High","WFC.Low","WFC.Close")]))))
  
  b<-data.frame(BBwidth=((data$up-data$dn)/data$mavg))
  
  data<-data %>% 
    cbind(b) %>% 
    
  select(-c(dn,up,mavg)) %>% 
    
  #------------------------------------
  select(-c(WFC.Adjusted,WFC.High,WFC.Low,WFC.Open,oscillator))

#remove rows that contains NA from Moving average calculation
data<-data[-c(1:39),]

###################
laggedDATA<-cbind(data$WFC.Close,data.frame(lapply(data[,-c(1,3)],lag)))
rownames(laggedDATA)<-rownames(data)
laggedDATA<-laggedDATA[-1,]
names(laggedDATA)[1]<-"CLOSE_t"


partitions <- modelr::resample_partition(laggedDATA, c(test = 0.2, train = 0.8))
train <- as.data.frame(partitions$train)
test  <- as.data.frame(partitions$test)
M1<-lm(CLOSE_t~.,data=train[,-22])
summary(M1)
predict(M1,test)

head(cbind(train,predict(lm(close~.,data=train),train))[,c(1,37)])
###############################


normalize <- function(x) {
  return ((((x - min(x)) / (max(x) - min(x)))*2)-1)
}


datanorm <- cbind(data.frame(data$target),data.frame(lapply(data[,c(1,3:ncol(data))], normalize)))
rownames(datanorm)<-rownames(data)
#####################################################
#create MACD signal variable --> if macd breaks signal point we set a sell/build signal. If it doesn't break, it will have "stay"
data$MACDseñal<-0
data$RSIseñal<-0

for(i in 2:nrow(data)){
  
  if(data$macd[i]<data$signal[i] & data$macd[i-1]>data$signal[i-1]){
    data$MACDseñal[i]<-"Sell"
  
  }else if(data$macd[i]>data$signal[i] & data$macd[i-1]<data$signal[i-1]){
    data$MACDseñal[i]<-"Buy"
    
  }else{data$MACDseñal[i]<-"Stay"}
}

for(i in 2:nrow(data)){
  
  if(data$fastK[i]<data$fastD[i] & data$fastK[i-1]>data$fastD[i-1]){
    data$RSIseñal[i]<-"Sell"
    
  }else if(data$fastK[i]>data$fastD[i] & data$fastK[i-1]<data$fastD[i-1]){
    data$RSIseñal[i]<-"Buy"
    
  }else{data$RSIseñal[i]<-"Stay"}
}




#remove first row
data<-data[-1,]
data$MACDseñal <- factor(data$MACDseñal)
data$RSIseñal <- factor(data$RSIseñal)

names(data)[10]<-"RSI"


################################################################
#training-validation split
  #2010-2016 train, 2017 validation, 2018 test
train<-data[year(rownames(data))%in%c(2000:2014),]
validation<-data[year(rownames(data))%in%c(2015,2016),]
test<-data[year(rownames(data))%in%c(2017),]

train<-laggedDATA[year(rownames(laggedDATA))%in%c(2000:2016),]
validation<-laggedDATA[year(rownames(laggedDATA))%in%c(2015,2016),]
test<-laggedDATA[year(rownames(laggedDATA))%in%c(2017),]

train<-datanorm[year(rownames(datanorm))%in%c(2000:2014),]
validation<-datanorm[year(rownames(datanorm))%in%c(2015,2016),]
test<-data[year(rownames(datanorm))%in%c(2017),]


#########################################################################################################################
#building model - LOGISTIC REGRESSION
M1<-glm(data = train,target~MSFT.Close+macd+RSI,family = "binomial")
M1<-glm(data = train,target~MSFT.Open+MSFT.High+MSFT.Close+MSFT.Low,family = "binomial")
M1<-glm(data = train,data.target~.,family = "binomial")

summary(M1)
Anova(M1)


#predict on validation sample
predict.glm(M1,validation,type = "response")

pred<-cut(predict.glm(M1,validation,type = "response"),c(-1,0.5,1),labels=c("Down","Up"))

confusionMatrix(pred,validation$data.target)


#predict on test sample
predtest<-cut(predict.glm(M1,test,type = "response"),c(-1,0.5,1),labels=c("Down","Up"))
confusionMatrix(predtest,test$target)
##########################################################################################################################

#########################################################################################################################
#building model - RANDOM FOREST
set.seed(420)
M1.rf <- randomForest(target~., data=train, importance=TRUE, nodesize=1 ,ntree=2500)
confusionMatrix(predict(M1.rf,validation),validation$target)

confusionMatrix(predict(M1.rf,test),test$target)


print(M1.rf)
plot(M1.rf)
M1.rf$predicted
M1.rf$type
M1.rf$mse#regression
M1.rf$importance
M1.rf$ntree
M1.rf$test

################parameter tuning
#mtry = number of variables tryed at each split
metric <- "RMSE"
####
#benchmark -> mtry=sqrt(features)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
set.seed(420)
mtry <- sqrt(ncol(train)) #recomended
tunegrid <- expand.grid(.mtry=mtry)
rf_default <- train(CLOSE_t~., data=train, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)
print(rf_default)

####grid search mtry=1:15
control <- trainControl(method="repeatedcv", number=10, repeats=3, search="grid")
set.seed(420)
tunegrid <- expand.grid(.mtry=c(1:15))
rf_gridsearch <- train(CLOSE_t~., data=train, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)
print(rf_gridsearch)
plot(rf_gridsearch)

#random search for nodesize
control <- trainControl(method="repeatedcv", number=10, repeats=3, search="grid")
set.seed(420)
tunegrid <- expand.grid(.nodesize=c(1:50))
rf_gridsearch <- train(CLOSE_t~., data=train, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)
print(rf_gridsearch)
plot(rf_gridsearch) #11

#############################3
M1.rf <- randomForest(CLOSE_t~., data=train, importance=TRUE, nodesize=100,mtry=11 ,ntree=500)
(r2 <- rSquared(test$CLOSE_t, test$CLOSE_t - predict(M1.rf, test)))
(mse <- mean((test$CLOSE_t - predict(M1.rf, test))^2))

fitted<-data.frame((M1.rf$predicted))
fitted_test<-data.frame(predict(M1.rf,test))
########################################################################################################################

M1<-glm(data = train,target~macd+EMA,family = "binomial")
predict.glm(M1,validation,type = "response")


ggplot()+
  geom_line(data=train,aes(x=1:nrow(train),y=CLOSE_t),col="red")+
  geom_line(data=fitted,aes(x=1:nrow(fitted),y=X.M1.rf.predicted.),col="green")

ggplot()+
  geom_line(data=test,aes(x=1:nrow(test),y=CLOSE_t),col="orange")+
  geom_line(data=fitted_test,aes(x=1:nrow(fitted_test),y=predict.M1.rf..test.),col="blue")
  

#################################################
#DNN classifier


response <- function() "Species"
features <- function() setdiff(names(iris), response())

# split into train, test datasets
set.seed(420)
partitions <- modelr::resample_partition(data, c(test = 0.2, train = 0.8))
iris_train <- as.data.frame(partitions$train)
iris_test  <- as.data.frame(partitions$test)

# construct feature columns
feature_columns <- feature_columns(
  column_numeric(features())
)

# construct classifier
classifier <- dnn_classifier(
  feature_columns = feature_columns,
  hidden_units = c(10, 20, 10),
  n_classes = 3
)

# construct input function 
iris_input_fn <- function(data) {
  input_fn(data, features = features(), response = response())
}

# train classifier with training dataset
train(classifier, input_fn = iris_input_fn(iris_train))

# valuate with test dataset
predictions <- predict(classifier, input_fn = iris_input_fn(iris_test))
evaluation <- evaluate(classifier, input_fn = iris_input_fn(iris_test))

