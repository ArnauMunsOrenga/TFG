library(quantmod)
library(TTR)
library(lubridate)
library(dplyr)
library(car)
library(caret)
library(randomForest)
library(rfUtilities)
library(e1071)
library(tfestimators)
library(modelr)

#https://www.labolsavirtual.com/
options(repos = c(CRAN = "http://cran.rstudio.com"))


getSymbols(Symbols = "AAPL",src = "av",
              api.key = "Q5UC0SVY5BZJVWLZ",
              return.class = "xts",
              periodicity = "intraday",
              interval = "1min",
              output.size = "full",
              data.type = "csv")


# 
# #getting data
# getSymbols(Symbols = "AAPL", from ="2000-01-01")
# #getSymbols(Symbols = "KHC", from ="2000-01-01",to="2017-12-31")
# getSymbols(Symbols = "WFC", from ="2000-01-01")
# getSymbols(Symbols = "AXP", from ="2000-01-01")
# #getSymbols(Symbols = "SNY", from ="2000-01-01")
# getSymbols(Symbols = "KO", from ="2000-01-01")
# 
# 
# 
# #ploting stock price
# chartSeries(AAPL)
# chartSeries(KO)
# chartSeries(AXP)
# chartSeries(WFC)
# chartSeries(SNY)
# 
# #leaving xts format
# prices<-as.data.frame(KO)
# prices<-as.data.frame(SNY)
# prices<-as.data.frame(WFC)
# 
# #create target variable. we want to predict whether the stock price of tomorrow is going to be upper or lower
# target<-c()
# for(i in 2:(nrow(SNY))){
#   if(as.numeric(SNY[i,4])>as.numeric(SNY[i-1,4])){
#     target[i]<-"Up"
#   }else{
#     target[i]<-"Down"
#   }
# }
# 
# #version2 prob good
# 
# target<-c()
# for(i in 1:(nrow(SNY)-1)){
#   if(as.numeric(SNY[i+1,4])>as.numeric(SNY[i,4])){
#     target[i]<-"Up"
#   }else{
#     target[i]<-"Down"
#   }
# }
# 
# target<-c()
# targetTest<-c()
# for(i in 1:(nrow(SNY)-30)){
#   if(as.numeric(SNY[i+30,4])>as.numeric(SNY[i,4])){
#     target[i]<-"Up"
#     targetTest[i+30]<-"Up"
#   }else{
#     target[i]<-"Down"
#     targetTest[i+30]<-"Down"
#   }
# }
# 
# target<-c()
# for(i in 1:(nrow(SNY)-20)){
#   if(as.numeric(SNY[i+20,4])>as.numeric(SNY[i,4])){
#     target[i]<-"Up"
#   }else{
#     target[i]<-"Down"
#   }
# }
# 
# data<-cbind(prices[-nrow(prices),],target)
# data<-cbind(prices[-c((nrow(prices)-9):nrow(prices)),],target)
# data<-cbind(prices[-c((nrow(prices)-29):nrow(prices)),],target)
# data2<-cbind(prices,targetTest)
# #data<-cbind(prices,target)
# #data<-data[-1,]
# data$target<-factor(data$target)
# data2$targetTest<-factor(data2$targetTest)
# 
# 
# ##Smoothing data
# 
# smooth.open<-c()
# smooth.low<-c()
# smooth.high<-c()
# smooth.close<-c()
# 
# data$SNY.Open[1]->smooth.open[1]
# data$SNY.High[1]->smooth.high[1]
# data$SNY.Low[1]->smooth.low[1]
# data$SNY.Close[1]->smooth.close[1]
# alpha<-0.1
# alpha<-1-(2/(4123+1))
# 
# 
# for(i in 2:nrow(data)){
#   smooth.open[i]<-alpha*data$SNY.Open[i]+((1-alpha)*smooth.open[i-1])
#   smooth.high[i]<-alpha*data$SNY.High[i]+((1-alpha)*smooth.high[i-1])
#   smooth.low[i]<-alpha*data$SNY.Low[i]+((1-alpha)*smooth.low[i-1])
#   smooth.close[i]<-alpha*data$SNY.Close[i]+((1-alpha)*smooth.close[i-1])
# }
# 
# 
# ######################33
# data<-cbind(data[-c(1:30),-c(1,2,3,4,6)],
#             Close=as.vector(EMA(SNY$SNY.Close,30)[-c(1:30,((nrow(EMA(SNY$SNY.Close,30))-29):nrow(EMA(SNY$SNY.Close,30)))),]),
#             High=as.vector(EMA(SNY$SNY.High,30)[-c(1:30,((nrow(EMA(SNY$SNY.High,30))-29):nrow(EMA(SNY$SNY.High,30)))),]),
#             Low=as.vector(EMA(SNY$SNY.Low,30)[-c(1:30,((nrow(EMA(SNY$SNY.Low,30))-29):nrow(EMA(SNY$SNY.Low,30)))),]),
#             Open=as.vector(EMA(SNY$SNY.Open,30)[-c(1:30,((nrow(EMA(SNY$SNY.Open,30))-29):nrow(EMA(SNY$SNY.Open,30)))),]))
# 
# 
# data<-cbind(data[,-c(1,2,3,4,6)],smooth.close,smooth.high,smooth.low,smooth.open)
# 
# dataplot<-data %>% mutate(date=as.Date(rownames(.)))
# dataplot1<-as.data.frame(EMA(SNY$SNY.Close,30)) %>% mutate(date1=as.Date(rownames(.)))
# dataplot2<-as.data.frame(EMA(SNY$SNY.Close,90)) %>% mutate(date1=as.Date(rownames(.)))
# dataplot3<-as.data.frame(EMA(SNY$SNY.Close,60)) %>% mutate(date1=as.Date(rownames(.)))
# 
# ggplot()+geom_line(data=dataplot,aes(x=date,y=smooth.close))+
#   geom_line(data=dataplot2,aes(x=date1,y=EMA),color="red",lwd=1)+
#   geom_line(data=dataplot3,aes(x=date1,y=EMA),color="blue",lwd=1)+
#   geom_line(data=dataplot1,aes(x=date1,y=EMA),color="orange",lwd=1)
# ###################################################
# #let's build our technical indicators
# data<-data %>% 
#   
#   #Aroon
#   cbind(aroon(data[,c("High","Low")],20)) %>% 
#   
#   #----------------------------------------
# 
# #Simple moving average 10 day
# cbind(sma10=SMA(data[,"Close"],10)) %>% 
#   
#   #----------------------------------------
# 
# #exponential moving average 10 day
# cbind(ema10=EMA(data[,"Close"],10)) %>% 
#   
#   #----------------------------------------
# 
# #momentum 1 day
# cbind(mom1=momentum(data[,"Close"],1)) %>%
#   cbind(mom2=momentum(data[,"Close"],2)) %>%
#   cbind(mom3=momentum(data[,"Close"],3)) %>%
#   cbind(mom4=momentum(data[,"Close"],4)) %>%
#   cbind(mom5=momentum(data[,"Close"],5)) %>%
#   
#   #momentum 9 day
#   cbind(mom9=momentum(data[,"Close"],9)) %>%
#   
#   cbind(mom15=momentum(data[,"Close"],15)) %>%
#   
#   #----------------------------------------
# 
# #Rate of change 1 day
# cbind(ROC1=ROC(data[,"Close"],1)) %>%
#   
#   #Rate of change 9 day
#   cbind(ROC9=ROC(data[,"Close"],9)) %>%
#   
#   #----------------------------------------
# 
# #fastK%, fastD% and slowD%
# #nFastK = 14, nFastD = 3, nSlowD = 3
# cbind(data.frame(stoch(as.xts(data[,c("High","Low","Close")])))) %>% 
#   
#   #SMI
#   #n = 13, nFast = 2, nSlow = 25
#   cbind(SMI=data.frame(SMI(as.xts(data[,c("High","Low","Close")])))[,1]) %>% 
#   
#   #----------------------------------------
# 
# #RSI
# cbind(RSI=RSI(data[,"Close"])) %>% 
#   
#   #----------------------------------------
# 
# #Williams Accumulation/Distribution
# cbind(data.frame(wAD=williamsAD(as.xts(data[,c("High","Low","Close")])))) %>% 
#   
#   #Williams Percentage range
#   cbind(data.frame(WPR(as.xts(data[,c("High","Low","Close")]))))
# 
# #names(data)[23]<-"WPR"
# names(data)[27]<-"WPR"
# #----------------------------------------
# 
# data<-data %>% 
#   #Moving Average convergence divergence
#   cbind(macd=MACD(data[,"Close"],12, 26, 9, maType="EMA" )[,1]) %>% 
#   
#   #----------------------------------------
# 
# #Comodity Channel Index
# cbind(data.frame(CCI=CCI(as.xts(data[,c("High","Low","Close")])))) %>% 
#   
#   #----------------------------------------
# 
# #On Balance Volume
# cbind(OBV=OBV(data[,"Close"],data[,"SNY.Volume"])) %>% 
#   
#   #----------------------------------------
# 
# #Average true range, true range1 and true range2
# cbind(data.frame(ATR(as.xts(data[,c("High","Low","Close")])))) 
# 
# b3<-data.frame(tr2=((data[,4]-data$trueLow)/(data$trueHigh-data$trueLow)))
# 
# data<-data %>% 
#   cbind(b3) %>% 
#   
#   select(-c(trueHigh,trueLow)) %>% 
#   
#   #----------------------------------------
# 
# #Trend detection index, using both TDI and DI
# cbind(TDI(data[,"Close"])) %>% 
#   
#   #ADX and DX and DIp/DIn
#   cbind(data.frame(ADX(as.xts(data[,c("High","Low","Close")]),20)))
# 
# b2<-data.frame(PNratio=data$DIp/data$DIn) 
# 
# data<-data %>% 
#   cbind(b2) %>% 
#   
#   select(-c(DIp,DIn)) %>% 
#   
#   #Bollinger band width
#   cbind(data.frame(BBands(as.xts(data[,c("High","Low","Close")]))))
# 
# b<-data.frame(BBwidth=((data$up-data$dn)/data$mavg))
# 
# data<-data %>% 
#   cbind(b) %>% 
#   
#   select(-c(dn,up,mavg)) %>% 
#   
#   #------------------------------------
# select(-c(oscillator))
# 
# data<-data[-c(1:39),]
# 
# data<-data[,-c(1,3,4,5,6)]
#train test split
train<-data[year(rownames(data))%in%c(2000:2017),]
test<-data[year(rownames(data))%in%c(2018),]


model<-randomForest(target~.,data=train)

confusionMatrix(predict(model,test),test$target)
confusionMatrix(predict(model,test[31:60,]),testprediction$targetTest[61:90])
##################################################3

#let's build our technical indicators
data<-data %>% 
  
  #Aroon
  cbind(aroon(data[,c("SNY.High","SNY.Low")],20)) %>% 
  
  #----------------------------------------
  
  #Simple moving average 10 day
  cbind(sma10=SMA(data[,"SNY.Close"],10)) %>% 
  
  #----------------------------------------
  
  #exponential moving average 10 day
  cbind(ema10=EMA(data[,"SNY.Close"],10)) %>% 
  
  #----------------------------------------
  
  #momentum 1 day
  cbind(mom1=momentum(data[,"SNY.Close"],1)) %>%
  cbind(mom2=momentum(data[,"SNY.Close"],2)) %>%
  cbind(mom3=momentum(data[,"SNY.Close"],3)) %>%
  cbind(mom4=momentum(data[,"SNY.Close"],4)) %>%
  cbind(mom5=momentum(data[,"SNY.Close"],5)) %>%
  
  #momentum 9 day
  cbind(mom9=momentum(data[,"SNY.Close"],9)) %>%
  
  cbind(mom15=momentum(data[,"SNY.Close"],15)) %>%
  
  #----------------------------------------

  #Rate of change 1 day
  cbind(ROC1=ROC(data[,"SNY.Close"],1)) %>%
  
  #Rate of change 9 day
  cbind(ROC9=ROC(data[,"SNY.Close"],9)) %>%

  #----------------------------------------

  #fastK%, fastD% and slowD%
#nFastK = 14, nFastD = 3, nSlowD = 3
  cbind(data.frame(stoch(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")])))) %>% 

  #SMI
  #n = 13, nFast = 2, nSlow = 25
  cbind(SMI=data.frame(SMI(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")])))[,1]) %>% 
  
  #----------------------------------------
    
  #RSI
  cbind(RSI=RSI(data[,"SNY.Close"])) %>% 

  #----------------------------------------

  #Williams Accumulation/Distribution
  cbind(data.frame(wAD=williamsAD(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")])))) %>% 
  
  #Williams Percentage range
  cbind(data.frame(WPR(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")]))))

  #names(data)[23]<-"WPR"
names(data)[28]<-"WPR"
  #----------------------------------------

  data<-data %>% 
  #Moving Average convergence divergence
  cbind(macd=MACD(data[,"SNY.Close"],12, 26, 9, maType="EMA" )[,1]) %>% 
  
  #----------------------------------------
  
  #Comodity Channel Index
  cbind(data.frame(CCI=CCI(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")])))) %>% 
  
  #----------------------------------------

  #On Balance Volume
  cbind(OBV=OBV(data[,"SNY.Close"],data[,"SNY.Volume"])) %>% 
  
  #----------------------------------------
  
  #Average true range, true range1 and true range2
  cbind(data.frame(ATR(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")])))) 
  
  b3<-data.frame(tr2=((data[,4]-data$trueLow)/(data$trueHigh-data$trueLow)))
  
  data<-data %>% 
    cbind(b3) %>% 
  
  select(-c(trueHigh,trueLow)) %>% 
    
  #----------------------------------------
  
  #Trend detection index, using both TDI and DI
  cbind(TDI(data[,"SNY.Close"])) %>% 
    
  #ADX and DX and DIp/DIn
  cbind(data.frame(ADX(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")]),20)))
  
  b2<-data.frame(PNratio=data$DIp/data$DIn) 
  
  data<-data %>% 
    cbind(b2) %>% 
  
  select(-c(DIp,DIn)) %>% 
    
  #Bollinger band width
  cbind(data.frame(BBands(as.xts(data[,c("SNY.High","SNY.Low","SNY.Close")]))))
  
  b<-data.frame(BBwidth=((data$up-data$dn)/data$mavg))
  
  data<-data %>% 
    cbind(b) %>% 
    
  select(-c(dn,up,mavg)) %>% 
    
  #------------------------------------
  select(-c(SNY.Adjusted,SNY.High,SNY.Low,SNY.Open,oscillator))

#remove rows that contains NA from Moving average calculation
data<-data[-c(1:39),]

###################
laggedDATA<-cbind(data$SNYC.Close,data.frame(lapply(data[,-c(1,3)],lag)))

target<-c()
for(i in 1:(nrow(laggedDATA)-1)){
  if(as.numeric(laggedDATA[i+1,1])>as.numeric(laggedDATA[i,1])){
    target[i+1]<-"Up"
  }else{
    target[i+1]<-"Down"
  }
}

laggedDATA<-cbind(laggedDATA,target=target)
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
train<-data[year(rownames(data))%in%c(2000:2017),]
validation<-data[year(rownames(data))%in%c(2015,2016),]
test<-data[year(rownames(data))%in%c(2018),]
testprediction<-data2[year(rownames(data2))%in%c(2017,2018),]

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
M1.rf <- randomForest(CLOSE_t~., data=train, importance=TRUE,mtry=11)
(r2 <- rSquared(test$CLOSE_t, test$CLOSE_t - predict(M1.rf, test)))
(mse <- mean((test$CLOSE_t - predict(M1.rf, test))^2))

fitted_train<-data.frame((M1.rf$predicted))
fitted_test<-data.frame(predict(M1.rf,test))
########################################################################################################################

M1<-glm(data = train,target~macd+EMA,family = "binomial")
predict.glm(M1,validation,type = "response")


ggplot()+
  geom_line(data=train,aes(x=1:nrow(train),y=CLOSE_t),col="red")+
  geom_line(data=fitted_train,aes(x=1:nrow(fitted_train),y=X.M1.rf.predicted.),col="green")


ggplot()+
  geom_line(data=test,aes(x=1:nrow(test),y=CLOSE_t),col="orange")+
  geom_line(data=fitted_test,aes(x=1:nrow(fitted_test),y=predict.M1.rf..test.),col="blue")
  
head(eval<-cbind(test$CLOSE_t,test$target,fitted_test))

target_pred<-c()
for(i in 1:(nrow(eval)-1)){
  if(as.numeric(eval[i+1,3])>as.numeric(eval[i,3])){
    target_pred[i]<-"Up"
  }else{
    target_pred[i]<-"Down"
  }
}

head(eval<-cbind(eval[-nrow(eval),],target_pred))

confusionMatrix(eval$`test$target`,eval$target_pred)
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



################################################################################
lag_transform <- function(x, k= 1){
  
  lagged =  c(rep(NA, k), x[1:(length(x)-k)])
  DF = as.data.frame(cbind(lagged, x))
  colnames(DF) <- c( paste0('x','lag',k), 'x')
  DF[is.na(DF)] <- 0
  return(DF)
}

supervised = lag_transform(diff(prices$KO.Close,1), 1)
N = nrow(supervised)
n = round(N *0.7, digits = 0)
train = supervised[1:n, ]
test  = supervised[(n+1):N,  ]


Mlag.rf<-randomForest(x~.,data=supervised[-c(nrow(supervised)-1,nrow(supervised)),],importance=TRUE)
predictions<-predict(Mlag.rf,data_frame(xlag1=last(test$xlag1)))
fore<-predict(Mlag.rf,test)
# 

#Type1 invert differentiation
for(i in 1:length(test$x)){
yhat  = predictions[i] + prices$KO.Close[(n+i)]
predictions[i]<-yhat
}

#Type2 invert differentiation
forecast<-c()
forecast[1]<-fore[1] + prices$KO.Close[(n+1)]
for(i in 2:length(test$x)){
  forecast[i]<-sum(fore[1:i]) + prices$KO.Close[(n+1)]
}



#

preddata<-data_frame(index=1:length(predictions),pred=predictions) #predictions
preddata<-data_frame(index=1:length(forecast),pred=forecast) # type 2 invert differentiation
testdata<-data_frame(index=1:length(forecast),test=as.numeric(KO$KO.Close[(n+1):(N)]))

ggplot()+
  geom_line(data=testdata,aes(x=index,y=test,col="orange"))+
  geom_line(data=preddata,aes(x=index,y=pred),col="blue")

  (mse <- mean((testdata$test - preddata$pred)^2))
(mse <- mean((test$x - fore)^2))

predict(Mlag.rf,test[nrow(test),])+KO$KO.Close[nrow(KO),]

45.96383 #close dia 20
