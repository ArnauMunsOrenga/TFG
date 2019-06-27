# #
# library(h2o)
# h2o.init()
# h2o.no_progress()  # Turn off progress bars for notebook readability
# #
# 
# 
# h2o.SMD<-function(train,test,company){
#   library(tidyverse)
#   train<-as.h2o(train %>% select(-c(aroonUp,aroonDn)))
#   test<-as.h2o(test%>% select(-c(aroonUp,aroonDn)))
# 
#   y <- "target"
#   x <- setdiff(names(train), c(y,"aroonUp","aroonDn"))
# 
#   aml <<- h2o.automl(y = y, x = x,
#                     training_frame = train,
#                     max_models =10,
#                     seed = 420,
#                     nfolds = 0, #no cross validation
#                     balance_classes = F,
#                     leaderboard_frame = test)
# 
#   se <<- h2o.getModel(as.data.frame(aml@leaderboard$model_id)[1,1])
# 
#   a<-data.frame(Company=company,
#              AUC=h2o.auc(h2o.performance(se, newdata = test)),
#              Accuracy=h2o.accuracy(h2o.performance(se, newdata = test),thresholds = 0.5)[[1]],
#              Model=as.data.frame(aml@leaderboard$model_id)[1,1])
#   return(a)
#   #accuracy
# 
# }
# 
# 
# h2o_KO_30_1m<-h2o.SMD(train = train_vali_KO_30_1m,test = test_KO_30_1m_target_feature,company = "KO_30_1m")
# h2o_KO_30_2m<-h2o.SMD(train = train_vali_KO_30_2m,test = test_KO_30_2m_target_feature,company = "KO_30_2m")
# h2o_KO_30_3m<-h2o.SMD(train = train_vali_KO_30_3m,test = test_KO_30_3m_target_feature,company = "KO_30_3m")
# 
# h2o_KO_60_1m<-h2o.SMD(train = train_vali_KO_60_1m,test = test_KO_60_1m_target_feature,company = "KO_60_1m")
# h2o_KO_60_2m<-h2o.SMD(train = train_vali_KO_60_2m,test = test_KO_60_2m_target_feature,company = "KO_60_2m")
# h2o_KO_60_3m<-h2o.SMD(train = train_vali_KO_60_3m,test = test_KO_60_3m_target_feature,company = "KO_60_3m")
# 
# h2o_KO_90_1m<-h2o.SMD(train = train_vali_KO_90_1m,test = test_KO_90_1m_target_feature,company = "KO_90_1m")
# h2o_KO_90_2m<-h2o.SMD(train = train_vali_KO_90_2m,test = test_KO_90_2m_target_feature,company = "KO_90_2m")
# h2o_KO_90_3m<-h2o.SMD(train = train_vali_KO_90_3m,test = test_KO_90_3m_target_feature,company = "KO_90_3m")
# 
# h2o_fun_1m<-h2o.SMD(train = train_vali_KO_fun_1m,test = test_KO_fun_1m_target_feature,company = "KO_fun_1m")
# h2o_fun_2m<-h2o.SMD(train = train_vali_KO_fun_2m,test = test_KO_fun_2m_target_feature,company = "KO_fun_2m")
# h2o_fun_3m<-h2o.SMD(train = train_vali_KO_fun_3m,test = test_KO_fun_3m_target_feature,company = "KO_fun_3m")
# 
# h2o.SMD.results<-h2o_KO_30_1m %>%
#   rbind(h2o_KO_30_2m,h2o_KO_30_3m,h2o_KO_60_1m,h2o_KO_60_2m,h2o_KO_60_3m,h2o_KO_90_1m,h2o_KO_90_2m,h2o_KO_90_3m,h2o_fun_1m,h2o_fun_2m,h2o_fun_3m)


#
#
#

#save.image(file = "C:/Users/i0386388/Desktop/tesis/Tesis/h2o_SMD_results.RData")

 
#plot(h2o.performance(se, newdata = test), type = "roc")