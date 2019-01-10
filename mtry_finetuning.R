#mtry fine tuning for RF. We'll use

errors_AAPL_30_1m_target_feature<-c()
errors_AAPL_30_2m_target_feature<-c()
errors_AAPL_30_3m_target_feature<-c()

errors_AAPL_60_1m_target_feature<-c()
errors_AAPL_60_2m_target_feature<-c()
errors_AAPL_60_3m_target_feature<-c()

errors_AAPL_90_1m_target_feature<-c()
errors_AAPL_90_2m_target_feature<-c()
errors_AAPL_90_3m_target_feature<-c()


errors_KO_30_1m_target_feature<-c()
errors_KO_30_2m_target_feature<-c()
errors_KO_30_3m_target_feature<-c()

errors_KO_60_1m_target_feature<-c()
errors_KO_60_2m_target_feature<-c()
errors_KO_60_3m_target_feature<-c()

errors_KO_90_1m_target_feature<-c()
errors_KO_90_2m_target_feature<-c()
errors_KO_90_3m_target_feature<-c()

errors_AXP_30_1m_target_feature<-c()
errors_AXP_30_2m_target_feature<-c()
errors_AXP_30_3m_target_feature<-c()

errors_AXP_60_1m_target_feature<-c()
errors_AXP_60_2m_target_feature<-c()
errors_AXP_60_3m_target_feature<-c()

errors_AXP_90_1m_target_feature<-c()
errors_AXP_90_2m_target_feature<-c()
errors_AXP_90_3m_target_feature<-c()

errors_WFC_30_1m_target_feature<-c()
errors_WFC_30_2m_target_feature<-c()
errors_WFC_30_3m_target_feature<-c()

errors_WFC_60_1m_target_feature<-c()
errors_WFC_60_2m_target_feature<-c()
errors_WFC_60_3m_target_feature<-c()

errors_WFC_90_1m_target_feature<-c()
errors_WFC_90_2m_target_feature<-c()
errors_WFC_90_3m_target_feature<-c()

errors_AAPL_fun_1m_target_feature<-c()
errors_AAPL_fun_2m_target_feature<-c()
errors_AAPL_fun_3m_target_feature<-c()

errors_KO_fun_1m_target_feature<-c()
errors_KO_fun_2m_target_feature<-c()
errors_KO_fun_3m_target_feature<-c()

errors_AXP_fun_1m_target_feature<-c()
errors_AXP_fun_2m_target_feature<-c()
errors_AXP_fun_3m_target_feature<-c()


errors_WFC_fun_1m_target_feature<-c()
errors_WFC_fun_2m_target_feature<-c()
errors_WFC_fun_3m_target_feature<-c()

for(i in 1:32){
  model_AAPL_30_1m_target_feature<-randomForest(target~.,data=train_AAPL_30_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_30_1m_target_feature,validation_AAPL_30_1m_target_feature),validation_AAPL_30_1m_target_feature$target)->a_AAPL_30_1m_target_feature
  errors_AAPL_30_1m_target_feature<-c(errors_AAPL_30_1m_target_feature,1-a_AAPL_30_1m_target_feature$overall[1])
  
  model_AAPL_30_2m_target_feature<-randomForest(target~.,data=train_AAPL_30_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_30_2m_target_feature,validation_AAPL_30_2m_target_feature),validation_AAPL_30_2m_target_feature$target)->a_AAPL_30_2m_target_feature
  errors_AAPL_30_2m_target_feature<-c(errors_AAPL_30_2m_target_feature,1-a_AAPL_30_2m_target_feature$overall[1])
  
  model_AAPL_30_3m_target_feature<-randomForest(target~.,data=train_AAPL_30_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_30_3m_target_feature,validation_AAPL_30_3m_target_feature),validation_AAPL_30_3m_target_feature$target)->a_AAPL_30_3m_target_feature
  errors_AAPL_30_3m_target_feature<-c(errors_AAPL_30_3m_target_feature,1-a_AAPL_30_3m_target_feature$overall[1])
  
  
  
  #~~
  
  model_AAPL_60_1m_target_feature<-randomForest(target~.,data=train_AAPL_60_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_60_1m_target_feature,validation_AAPL_60_1m_target_feature),validation_AAPL_60_1m_target_feature$target)->a_AAPL_60_1m_target_feature
  errors_AAPL_60_1m_target_feature<-c(errors_AAPL_60_1m_target_feature,1-a_AAPL_60_1m_target_feature$overall[1])
  
  model_AAPL_60_2m_target_feature<-randomForest(target~.,data=train_AAPL_60_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_60_2m_target_feature,validation_AAPL_60_2m_target_feature),validation_AAPL_60_2m_target_feature$target)->a_AAPL_60_2m_target_feature
  errors_AAPL_60_2m_target_feature<-c(errors_AAPL_60_2m_target_feature,1-a_AAPL_60_2m_target_feature$overall[1])
  
  model_AAPL_60_3m_target_feature<-randomForest(target~.,data=train_AAPL_60_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_60_3m_target_feature,validation_AAPL_60_3m_target_feature),validation_AAPL_60_3m_target_feature$target)->a_AAPL_60_3m_target_feature
  errors_AAPL_60_3m_target_feature<-c(errors_AAPL_60_3m_target_feature,1-a_AAPL_60_3m_target_feature$overall[1])
  
  #~~
  model_AAPL_90_1m_target_feature<-randomForest(target~.,data=train_AAPL_90_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_90_1m_target_feature,validation_AAPL_90_1m_target_feature),validation_AAPL_90_1m_target_feature$target)->a_AAPL_90_1m_target_feature
  errors_AAPL_90_1m_target_feature<-c(errors_AAPL_90_1m_target_feature,1-a_AAPL_90_1m_target_feature$overall[1])
  
  model_AAPL_90_2m_target_feature<-randomForest(target~.,data=train_AAPL_90_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_90_2m_target_feature,validation_AAPL_90_2m_target_feature),validation_AAPL_90_2m_target_feature$target)->a_AAPL_90_2m_target_feature
  errors_AAPL_90_2m_target_feature<-c(errors_AAPL_90_2m_target_feature,1-a_AAPL_90_2m_target_feature$overall[1])
  
  model_AAPL_90_3m_target_feature<-randomForest(target~.,data=train_AAPL_90_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_90_3m_target_feature,validation_AAPL_90_3m_target_feature),validation_AAPL_90_3m_target_feature$target)->a_AAPL_90_3m_target_feature
  errors_AAPL_90_3m_target_feature<-c(errors_AAPL_90_3m_target_feature,1-a_AAPL_90_3m_target_feature$overall[1])
  
  print("AAPL OK")
  
  ##  
  
  model_KO_30_1m_target_feature<-randomForest(target~.,data=train_KO_30_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_30_1m_target_feature,validation_KO_30_1m_target_feature),validation_KO_30_1m_target_feature$target)->a_KO_30_1m_target_feature
  errors_KO_30_1m_target_feature<-c(errors_KO_30_1m_target_feature,1-a_KO_30_1m_target_feature$overall[1])
  
  model_KO_30_2m_target_feature<-randomForest(target~.,data=train_KO_30_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_30_2m_target_feature,validation_KO_30_2m_target_feature),validation_KO_30_2m_target_feature$target)->a_KO_30_2m_target_feature
  errors_KO_30_2m_target_feature<-c(errors_KO_30_2m_target_feature,1-a_KO_30_2m_target_feature$overall[1])
  
  
  model_KO_30_3m_target_feature<-randomForest(target~.,data=train_KO_30_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_30_3m_target_feature,validation_KO_30_3m_target_feature),validation_KO_30_3m_target_feature$target)->a_KO_30_3m_target_feature
  errors_KO_30_3m_target_feature<-c(errors_KO_30_3m_target_feature,1-a_KO_30_3m_target_feature$overall[1])
  
  #~~
  
  model_KO_60_1m_target_feature<-randomForest(target~.,data=train_KO_60_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_60_1m_target_feature,validation_KO_60_1m_target_feature),validation_KO_60_1m_target_feature$target)->a_KO_60_1m_target_feature
  errors_KO_60_1m_target_feature<-c(errors_KO_60_1m_target_feature,1-a_KO_60_1m_target_feature$overall[1])
  
  model_KO_60_2m_target_feature<-randomForest(target~.,data=train_KO_60_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_60_2m_target_feature,validation_KO_60_2m_target_feature),validation_KO_60_2m_target_feature$target)->a_KO_60_2m_target_feature
  errors_KO_60_2m_target_feature<-c(errors_KO_60_2m_target_feature,1-a_KO_60_2m_target_feature$overall[1])
  
  
  model_KO_60_3m_target_feature<-randomForest(target~.,data=train_KO_60_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_60_3m_target_feature,validation_KO_60_3m_target_feature),validation_KO_60_3m_target_feature$target)->a_KO_60_3m_target_feature
  errors_KO_60_3m_target_feature<-c(errors_KO_60_3m_target_feature,1-a_KO_60_3m_target_feature$overall[1])
  
  #~~
  model_KO_90_1m_target_feature<-randomForest(target~.,data=train_KO_90_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_90_1m_target_feature,validation_KO_90_1m_target_feature),validation_KO_90_1m_target_feature$target)->a_KO_90_1m_target_feature
  errors_KO_90_1m_target_feature<-c(errors_KO_90_1m_target_feature,1-a_KO_90_1m_target_feature$overall[1])
  
  model_KO_90_2m_target_feature<-randomForest(target~.,data=train_KO_90_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_90_2m_target_feature,validation_KO_90_2m_target_feature),validation_KO_90_2m_target_feature$target)->a_KO_90_2m_target_feature
  errors_KO_90_2m_target_feature<-c(errors_KO_90_2m_target_feature,1-a_KO_90_2m_target_feature$overall[1])
  
  
  model_KO_90_3m_target_feature<-randomForest(target~.,data=train_KO_90_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_90_3m_target_feature,validation_KO_90_3m_target_feature),validation_KO_90_3m_target_feature$target)->a_KO_90_3m_target_feature
  errors_KO_90_3m_target_feature<-c(errors_KO_90_3m_target_feature,1-a_KO_90_3m_target_feature$overall[1])
  
  ##  
  print("KO OK")
  model_AXP_30_1m_target_feature<-randomForest(target~.,data=train_AXP_30_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_30_1m_target_feature,validation_AXP_30_1m_target_feature),validation_AXP_30_1m_target_feature$target)->a_AXP_30_1m_target_feature
  errors_AXP_30_1m_target_feature<-c(errors_AXP_30_1m_target_feature,1-a_AXP_30_1m_target_feature$overall[1])
  
  model_AXP_30_2m_target_feature<-randomForest(target~.,data=train_AXP_30_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_30_2m_target_feature,validation_AXP_30_2m_target_feature),validation_AXP_30_2m_target_feature$target)->a_AXP_30_2m_target_feature
  errors_AXP_30_2m_target_feature<-c(errors_AXP_30_2m_target_feature,1-a_AXP_30_2m_target_feature$overall[1])
  
  model_AXP_30_3m_target_feature<-randomForest(target~.,data=train_AXP_30_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_30_3m_target_feature,validation_AXP_30_3m_target_feature),validation_AXP_30_3m_target_feature$target)->a_AXP_30_3m_target_feature
  errors_AXP_30_3m_target_feature<-c(errors_AXP_30_3m_target_feature,1-a_AXP_30_3m_target_feature$overall[1])
  
  #~~
  
  
  model_AXP_60_1m_target_feature<-randomForest(target~.,data=train_AXP_60_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_60_1m_target_feature,validation_AXP_60_1m_target_feature),validation_AXP_60_1m_target_feature$target)->a_AXP_60_1m_target_feature
  errors_AXP_60_1m_target_feature<-c(errors_AXP_60_1m_target_feature,1-a_AXP_60_1m_target_feature$overall[1])
  
  model_AXP_60_2m_target_feature<-randomForest(target~.,data=train_AXP_60_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_60_2m_target_feature,validation_AXP_60_2m_target_feature),validation_AXP_60_2m_target_feature$target)->a_AXP_60_2m_target_feature
  errors_AXP_60_2m_target_feature<-c(errors_AXP_60_2m_target_feature,1-a_AXP_60_2m_target_feature$overall[1])
  
  model_AXP_60_3m_target_feature<-randomForest(target~.,data=train_AXP_60_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_60_3m_target_feature,validation_AXP_60_3m_target_feature),validation_AXP_60_3m_target_feature$target)->a_AXP_60_3m_target_feature
  errors_AXP_60_3m_target_feature<-c(errors_AXP_60_3m_target_feature,1-a_AXP_60_3m_target_feature$overall[1])
  #~~
  
  model_AXP_90_1m_target_feature<-randomForest(target~.,data=train_AXP_90_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_90_1m_target_feature,validation_AXP_90_1m_target_feature),validation_AXP_90_1m_target_feature$target)->a_AXP_90_1m_target_feature
  errors_AXP_90_1m_target_feature<-c(errors_AXP_90_1m_target_feature,1-a_AXP_90_1m_target_feature$overall[1])
  
  model_AXP_90_2m_target_feature<-randomForest(target~.,data=train_AXP_90_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_90_2m_target_feature,validation_AXP_90_2m_target_feature),validation_AXP_90_2m_target_feature$target)->a_AXP_90_2m_target_feature
  errors_AXP_90_2m_target_feature<-c(errors_AXP_90_2m_target_feature,1-a_AXP_90_2m_target_feature$overall[1])
  
  model_AXP_90_3m_target_feature<-randomForest(target~.,data=train_AXP_90_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_90_3m_target_feature,validation_AXP_90_3m_target_feature),validation_AXP_90_3m_target_feature$target)->a_AXP_90_3m_target_feature
  errors_AXP_90_3m_target_feature<-c(errors_AXP_90_3m_target_feature,1-a_AXP_90_3m_target_feature$overall[1])
  
  ##  
  print("AXP OK")
  model_WFC_30_1m_target_feature<-randomForest(target~.,data=train_WFC_30_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_30_1m_target_feature,validation_WFC_30_1m_target_feature),validation_WFC_30_1m_target_feature$target)->a_WFC_30_1m_target_feature
  errors_WFC_30_1m_target_feature<-c(errors_WFC_30_1m_target_feature,1-a_WFC_30_1m_target_feature$overall[1])
  
  
  model_WFC_30_2m_target_feature<-randomForest(target~.,data=train_WFC_30_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_30_2m_target_feature,validation_WFC_30_2m_target_feature),validation_WFC_30_2m_target_feature$target)->a_WFC_30_2m_target_feature
  errors_WFC_30_2m_target_feature<-c(errors_WFC_30_2m_target_feature,1-a_WFC_30_2m_target_feature$overall[1])
  
  
  model_WFC_30_3m_target_feature<-randomForest(target~.,data=train_WFC_30_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_30_3m_target_feature,validation_WFC_30_3m_target_feature),validation_WFC_30_3m_target_feature$target)->a_WFC_30_3m_target_feature
  errors_WFC_30_3m_target_feature<-c(errors_WFC_30_3m_target_feature,1-a_WFC_30_3m_target_feature$overall[1])
  
  
  #~~
  model_WFC_60_1m_target_feature<-randomForest(target~.,data=train_WFC_60_1m_target_feature[-c(1:17),],mtry=i)
  confusionMatrix(predict(model_WFC_60_1m_target_feature,validation_WFC_60_1m_target_feature),validation_WFC_60_1m_target_feature$target)->a_WFC_60_1m_target_feature
  errors_WFC_60_1m_target_feature<-c(errors_WFC_60_1m_target_feature,1-a_WFC_60_1m_target_feature$overall[1])
  
  model_WFC_60_2m_target_feature<-randomForest(target~.,data=train_WFC_60_2m_target_feature[-c(1:17),],mtry=i)
  confusionMatrix(predict(model_WFC_60_2m_target_feature,validation_WFC_60_2m_target_feature),validation_WFC_60_2m_target_feature$target)->a_WFC_60_2m_target_feature
  errors_WFC_60_2m_target_feature<-c(errors_WFC_60_2m_target_feature,1-a_WFC_60_2m_target_feature$overall[1])
  
  
  model_WFC_60_3m_target_feature<-randomForest(target~.,data=train_WFC_60_3m_target_feature[-c(1:17),],mtry=i)
  confusionMatrix(predict(model_WFC_60_3m_target_feature,validation_WFC_60_3m_target_feature),validation_WFC_60_3m_target_feature$target)->a_WFC_60_3m_target_feature
  errors_WFC_60_3m_target_feature<-c(errors_WFC_60_3m_target_feature,1-a_WFC_60_3m_target_feature$overall[1])
  #~~
  
  
  model_WFC_90_1m_target_feature<-randomForest(target~.,data=train_WFC_90_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_90_1m_target_feature,validation_WFC_90_1m_target_feature),validation_WFC_90_1m_target_feature$target)->a_WFC_90_1m_target_feature
  errors_WFC_90_1m_target_feature<-c(errors_WFC_90_1m_target_feature,1-a_WFC_90_1m_target_feature$overall[1])
  
  model_WFC_90_2m_target_feature<-randomForest(target~.,data=train_WFC_90_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_90_2m_target_feature,validation_WFC_90_2m_target_feature),validation_WFC_90_2m_target_feature$target)->a_WFC_90_2m_target_feature
  errors_WFC_90_2m_target_feature<-c(errors_WFC_90_2m_target_feature,1-a_WFC_90_2m_target_feature$overall[1])
  
  
  model_WFC_90_3m_target_feature<-randomForest(target~.,data=train_WFC_90_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_90_3m_target_feature,validation_WFC_90_3m_target_feature),validation_WFC_90_3m_target_feature$target)->a_WFC_90_3m_target_feature
  errors_WFC_90_3m_target_feature<-c(errors_WFC_90_3m_target_feature,1-a_WFC_90_3m_target_feature$overall[1])
  
  print("WFC OK")
  
  model_AAPL_fun_1m_target_feature<-randomForest(target~.,data=train_AAPL_fun_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_fun_1m_target_feature,validation_AAPL_fun_1m_target_feature),validation_AAPL_fun_1m_target_feature$target)->a_AAPL_fun_1m_target_feature
  errors_AAPL_fun_1m_target_feature<-c(errors_AAPL_fun_1m_target_feature,1-a_AAPL_fun_1m_target_feature$overall[1])
  
  model_AAPL_fun_2m_target_feature<-randomForest(target~.,data=train_AAPL_fun_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_fun_1m_target_feature,validation_AAPL_fun_2m_target_feature),validation_AAPL_fun_2m_target_feature$target)->a_AAPL_fun_2m_target_feature
  errors_AAPL_fun_2m_target_feature<-c(errors_AAPL_fun_2m_target_feature,1-a_AAPL_fun_2m_target_feature$overall[1])
  
  model_AAPL_fun_3m_target_feature<-randomForest(target~.,data=train_AAPL_fun_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AAPL_fun_1m_target_feature,validation_AAPL_fun_3m_target_feature),validation_AAPL_fun_3m_target_feature$target)->a_AAPL_fun_3m_target_feature
  errors_AAPL_fun_3m_target_feature<-c(errors_AAPL_fun_3m_target_feature,1-a_AAPL_fun_3m_target_feature$overall[1])
  
  
  
  
  model_KO_fun_1m_target_feature<-randomForest(target~.,data=train_KO_fun_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_fun_1m_target_feature,validation_KO_fun_1m_target_feature),validation_KO_fun_1m_target_feature$target)->a_KO_fun_1m_target_feature
  errors_KO_fun_1m_target_feature<-c(errors_KO_fun_1m_target_feature,1-a_KO_fun_1m_target_feature$overall[1])
  
  model_KO_fun_2m_target_feature<-randomForest(target~.,data=train_KO_fun_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_fun_1m_target_feature,validation_KO_fun_2m_target_feature),validation_KO_fun_2m_target_feature$target)->a_KO_fun_2m_target_feature
  errors_KO_fun_2m_target_feature<-c(errors_KO_fun_2m_target_feature,1-a_KO_fun_2m_target_feature$overall[1])
  
  model_KO_fun_3m_target_feature<-randomForest(target~.,data=train_KO_fun_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_KO_fun_1m_target_feature,validation_KO_fun_3m_target_feature),validation_KO_fun_3m_target_feature$target)->a_KO_fun_3m_target_feature
  errors_KO_fun_3m_target_feature<-c(errors_KO_fun_3m_target_feature,1-a_KO_fun_3m_target_feature$overall[1])
  
  
  
  model_AXP_fun_1m_target_feature<-randomForest(target~.,data=train_AXP_fun_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_fun_1m_target_feature,validation_AXP_fun_1m_target_feature),validation_AXP_fun_1m_target_feature$target)->a_AXP_fun_1m_target_feature
  errors_AXP_fun_1m_target_feature<-c(errors_AXP_fun_1m_target_feature,1-a_AXP_fun_1m_target_feature$overall[1])
  
  model_AXP_fun_2m_target_feature<-randomForest(target~.,data=train_AXP_fun_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_fun_1m_target_feature,validation_AXP_fun_2m_target_feature),validation_AXP_fun_2m_target_feature$target)->a_AXP_fun_2m_target_feature
  errors_AXP_fun_2m_target_feature<-c(errors_AXP_fun_2m_target_feature,1-a_AXP_fun_2m_target_feature$overall[1])
  
  model_AXP_fun_3m_target_feature<-randomForest(target~.,data=train_AXP_fun_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_AXP_fun_1m_target_feature,validation_AXP_fun_3m_target_feature),validation_AXP_fun_3m_target_feature$target)->a_AXP_fun_3m_target_feature
  errors_AXP_fun_3m_target_feature<-c(errors_AXP_fun_3m_target_feature,1-a_AXP_fun_3m_target_feature$overall[1])
  
  
  
  model_WFC_fun_1m_target_feature<-randomForest(target~.,data=train_WFC_fun_1m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_fun_1m_target_feature,validation_WFC_fun_1m_target_feature),validation_WFC_fun_1m_target_feature$target)->a_WFC_fun_1m_target_feature
  errors_WFC_fun_1m_target_feature<-c(errors_WFC_fun_1m_target_feature,1-a_WFC_fun_1m_target_feature$overall[1])
  
  model_WFC_fun_2m_target_feature<-randomForest(target~.,data=train_WFC_fun_2m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_fun_1m_target_feature,validation_WFC_fun_2m_target_feature),validation_WFC_fun_2m_target_feature$target)->a_WFC_fun_2m_target_feature
  errors_WFC_fun_2m_target_feature<-c(errors_WFC_fun_2m_target_feature,1-a_WFC_fun_2m_target_feature$overall[1])
  
  model_WFC_fun_3m_target_feature<-randomForest(target~.,data=train_WFC_fun_3m_target_feature,mtry=i)
  confusionMatrix(predict(model_WFC_fun_1m_target_feature,validation_WFC_fun_3m_target_feature),validation_WFC_fun_3m_target_feature$target)->a_WFC_fun_3m_target_feature
  errors_WFC_fun_3m_target_feature<-c(errors_WFC_fun_3m_target_feature,1-a_WFC_fun_3m_target_feature$overall[1])
  
  print("fun OK")
  
  
  print(paste0(i," finished"))
}






for(i in 1:32){
 
}

m_AAPL_30_1m_target_feature<-randomForest(target~.,data=train_AAPL_30_1m_target_feature)


confusionMatrix(predict(m_AAPL_30_1m_target_feature,validation_AAPL_30_1m_target_feature),validation_AAPL_30_1m_target_feature$target)


for(i in 1:32){

model_AXP_30_3m_target_feature<-randomForest(target~.,data=train_AXP_30_3m_target_feature,mtry=i)
confusionMatrix(predict(model_AXP_30_3m_target_feature,validation_AXP_30_3m_target_feature),validation_AXP_30_3m_target_feature$target)->a_AXP_30_3m_target_feature
errors_AXP_30_3m_target_feature<-c(errors_AXP_30_3m_target_feature,1-a_AXP_30_3m_target_feature$overall[1])

#~~

model_AXP_60_3m_target_feature<-randomForest(target~.,data=train_AXP_60_3m_target_feature,mtry=i)
confusionMatrix(predict(model_AXP_60_3m_target_feature,validation_AXP_60_3m_target_feature),validation_AXP_60_3m_target_feature$target)->a_AXP_60_3m_target_feature
errors_AXP_60_3m_target_feature<-c(errors_AXP_60_3m_target_feature,1-a_AXP_60_3m_target_feature$overall[1])
#~~



model_AXP_90_3m_target_feature<-randomForest(target~.,data=train_AXP_90_3m_target_feature,mtry=i)
confusionMatrix(predict(model_AXP_90_3m_target_feature,validation_AXP_90_3m_target_feature),validation_AXP_90_3m_target_feature$target)->a_AXP_90_3m_target_feature
errors_AXP_90_3m_target_feature<-c(errors_AXP_90_3m_target_feature,1-a_AXP_90_3m_target_feature$overall[1])




model_AXP_fun_3m_target_feature<-randomForest(target~.,data=train_AXP_fun_3m_target_feature,mtry=i)
confusionMatrix(predict(model_AXP_fun_1m_target_feature,validation_AXP_fun_3m_target_feature),validation_AXP_fun_3m_target_feature$target)->a_AXP_fun_3m_target_feature
errors_AXP_fun_3m_target_feature<-c(errors_AXP_fun_3m_target_feature,1-a_AXP_fun_3m_target_feature$overall[1])



}
