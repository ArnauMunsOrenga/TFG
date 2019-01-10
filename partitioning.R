#partitioning


train_AAPL_30_1m_target_feature<-
  AAPL_30_1m_target_feature[year(rownames(AAPL_30_1m_target_feature))%in%c(2000:2017),]

validation_AAPL_30_1m_target_feature<-
  AAPL_30_1m_target_feature[year(rownames(AAPL_30_1m_target_feature))%in%c(2018) & month(rownames(AAPL_30_1m_target_feature))%in%c(1:6),]

test_AAPL_30_1m_target_feature<-
  AAPL_30_1m_target_feature[year(rownames(AAPL_30_1m_target_feature))%in%c(2018) &      month(rownames(AAPL_30_1m_target_feature))%in%c(7:12),]



train_AAPL_60_1m_target_feature<-
  AAPL_60_1m_target_feature[year(rownames(AAPL_60_1m_target_feature))%in%c(2000:2017),]

validation_AAPL_60_1m_target_feature<-
  AAPL_60_1m_target_feature[year(rownames(AAPL_60_1m_target_feature))%in%c(2018) & month(rownames(AAPL_60_1m_target_feature))%in%c(1:6),]

test_AAPL_60_1m_target_feature<-
  AAPL_60_1m_target_feature[year(rownames(AAPL_60_1m_target_feature))%in%c(2018) &      month(rownames(AAPL_60_1m_target_feature))%in%c(7:12),]




train_AAPL_90_1m_target_feature<-
  AAPL_90_1m_target_feature[year(rownames(AAPL_90_1m_target_feature))%in%c(2000:2017),]

validation_AAPL_90_1m_target_feature<-
  AAPL_90_1m_target_feature[year(rownames(AAPL_90_1m_target_feature))%in%c(2018) & month(rownames(AAPL_90_1m_target_feature))%in%c(1:6),]

test_AAPL_90_1m_target_feature<-
  AAPL_90_1m_target_feature[year(rownames(AAPL_90_1m_target_feature))%in%c(2018) &      month(rownames(AAPL_90_1m_target_feature))%in%c(7:12),]



train_AAPL_30_2m_target_feature<-
  AAPL_30_2m_target_feature[year(rownames(AAPL_30_2m_target_feature))%in%c(2000:2017),]

validation_AAPL_30_2m_target_feature<-
  AAPL_30_2m_target_feature[year(rownames(AAPL_30_2m_target_feature))%in%c(2018) & month(rownames(AAPL_30_2m_target_feature))%in%c(1:6),]

test_AAPL_30_2m_target_feature<-
  AAPL_30_2m_target_feature[year(rownames(AAPL_30_2m_target_feature))%in%c(2018) &      month(rownames(AAPL_30_2m_target_feature))%in%c(7:12),]



train_AAPL_60_2m_target_feature<-
  AAPL_60_2m_target_feature[year(rownames(AAPL_60_2m_target_feature))%in%c(2000:2017),]

validation_AAPL_60_2m_target_feature<-
  AAPL_60_2m_target_feature[year(rownames(AAPL_60_2m_target_feature))%in%c(2018) & month(rownames(AAPL_60_2m_target_feature))%in%c(1:6),]

test_AAPL_60_2m_target_feature<-
  AAPL_60_2m_target_feature[year(rownames(AAPL_60_2m_target_feature))%in%c(2018) &      month(rownames(AAPL_60_2m_target_feature))%in%c(7:12),]




train_AAPL_90_2m_target_feature<-
  AAPL_90_2m_target_feature[year(rownames(AAPL_90_2m_target_feature))%in%c(2000:2017),]

validation_AAPL_90_2m_target_feature<-
  AAPL_90_2m_target_feature[year(rownames(AAPL_90_2m_target_feature))%in%c(2018) & month(rownames(AAPL_90_2m_target_feature))%in%c(1:6),]

test_AAPL_90_2m_target_feature<-
  AAPL_90_2m_target_feature[year(rownames(AAPL_90_2m_target_feature))%in%c(2018) &      month(rownames(AAPL_90_2m_target_feature))%in%c(7:12),]


train_AAPL_30_3m_target_feature<-
  AAPL_30_3m_target_feature[year(rownames(AAPL_30_3m_target_feature))%in%c(2000:2017),]

validation_AAPL_30_3m_target_feature<-
  AAPL_30_3m_target_feature[year(rownames(AAPL_30_3m_target_feature))%in%c(2018) & month(rownames(AAPL_30_3m_target_feature))%in%c(1:6),]

test_AAPL_30_3m_target_feature<-
  AAPL_30_3m_target_feature[year(rownames(AAPL_30_3m_target_feature))%in%c(2018) &      month(rownames(AAPL_30_3m_target_feature))%in%c(7:12),]



train_AAPL_60_3m_target_feature<-
  AAPL_60_3m_target_feature[year(rownames(AAPL_60_3m_target_feature))%in%c(2000:2017),]

validation_AAPL_60_3m_target_feature<-
  AAPL_60_3m_target_feature[year(rownames(AAPL_60_3m_target_feature))%in%c(2018) & month(rownames(AAPL_60_3m_target_feature))%in%c(1:6),]

test_AAPL_60_3m_target_feature<-
  AAPL_60_3m_target_feature[year(rownames(AAPL_60_3m_target_feature))%in%c(2018) &      month(rownames(AAPL_60_3m_target_feature))%in%c(7:12),]




train_AAPL_90_3m_target_feature<-
  AAPL_90_3m_target_feature[year(rownames(AAPL_90_3m_target_feature))%in%c(2000:2017),]

validation_AAPL_90_3m_target_feature<-
  AAPL_90_3m_target_feature[year(rownames(AAPL_90_3m_target_feature))%in%c(2018) & month(rownames(AAPL_90_3m_target_feature))%in%c(1:6),]

test_AAPL_90_3m_target_feature<-
  AAPL_90_3m_target_feature[year(rownames(AAPL_90_3m_target_feature))%in%c(2018) &      month(rownames(AAPL_90_3m_target_feature))%in%c(7:12),]

#fun
train_AAPL_fun_1m_target_feature<-
  AAPL_fun_1m_target_feature[year(rownames(AAPL_fun_1m_target_feature))%in%c(2000:2017),]

validation_AAPL_fun_1m_target_feature<-
  AAPL_fun_1m_target_feature[year(rownames(AAPL_fun_1m_target_feature))%in%c(2018) & month(rownames(AAPL_fun_1m_target_feature))%in%c(1:6),]

test_AAPL_fun_1m_target_feature<-
  AAPL_fun_1m_target_feature[year(rownames(AAPL_fun_1m_target_feature))%in%c(2018) &      month(rownames(AAPL_fun_1m_target_feature))%in%c(7:12),]

train_AAPL_fun_2m_target_feature<-
  AAPL_fun_2m_target_feature[year(rownames(AAPL_fun_2m_target_feature))%in%c(2000:2017),]

validation_AAPL_fun_2m_target_feature<-
  AAPL_fun_2m_target_feature[year(rownames(AAPL_fun_2m_target_feature))%in%c(2018) & month(rownames(AAPL_fun_2m_target_feature))%in%c(1:6),]

test_AAPL_fun_2m_target_feature<-
  AAPL_fun_2m_target_feature[year(rownames(AAPL_fun_2m_target_feature))%in%c(2018) &      month(rownames(AAPL_fun_2m_target_feature))%in%c(7:12),]

train_AAPL_fun_3m_target_feature<-
  AAPL_fun_3m_target_feature[year(rownames(AAPL_fun_3m_target_feature))%in%c(2000:2017),]

validation_AAPL_fun_3m_target_feature<-
  AAPL_fun_3m_target_feature[year(rownames(AAPL_fun_3m_target_feature))%in%c(2018) & month(rownames(AAPL_fun_3m_target_feature))%in%c(1:6),]

test_AAPL_fun_3m_target_feature<-
  AAPL_fun_3m_target_feature[year(rownames(AAPL_fun_3m_target_feature))%in%c(2018) &      month(rownames(AAPL_fun_3m_target_feature))%in%c(7:12),]

#---------------------

train_KO_30_1m_target_feature<-
  KO_30_1m_target_feature[year(rownames(KO_30_1m_target_feature))%in%c(2000:2017),]

validation_KO_30_1m_target_feature<-
  KO_30_1m_target_feature[year(rownames(KO_30_1m_target_feature))%in%c(2018) & month(rownames(KO_30_1m_target_feature))%in%c(1:6),]

test_KO_30_1m_target_feature<-
  KO_30_1m_target_feature[year(rownames(KO_30_1m_target_feature))%in%c(2018) &      month(rownames(KO_30_1m_target_feature))%in%c(7:12),]



train_KO_60_1m_target_feature<-
  KO_60_1m_target_feature[year(rownames(KO_60_1m_target_feature))%in%c(2000:2017),]

validation_KO_60_1m_target_feature<-
  KO_60_1m_target_feature[year(rownames(KO_60_1m_target_feature))%in%c(2018) & month(rownames(KO_60_1m_target_feature))%in%c(1:6),]

test_KO_60_1m_target_feature<-
  KO_60_1m_target_feature[year(rownames(KO_60_1m_target_feature))%in%c(2018) &      month(rownames(KO_60_1m_target_feature))%in%c(7:12),]




train_KO_90_1m_target_feature<-
  KO_90_1m_target_feature[year(rownames(KO_90_1m_target_feature))%in%c(2000:2017),]

validation_KO_90_1m_target_feature<-
  KO_90_1m_target_feature[year(rownames(KO_90_1m_target_feature))%in%c(2018) & month(rownames(KO_90_1m_target_feature))%in%c(1:6),]

test_KO_90_1m_target_feature<-
  KO_90_1m_target_feature[year(rownames(KO_90_1m_target_feature))%in%c(2018) &      month(rownames(KO_90_1m_target_feature))%in%c(7:12),]



train_KO_30_2m_target_feature<-
  KO_30_2m_target_feature[year(rownames(KO_30_2m_target_feature))%in%c(2000:2017),]

validation_KO_30_2m_target_feature<-
  KO_30_2m_target_feature[year(rownames(KO_30_2m_target_feature))%in%c(2018) & month(rownames(KO_30_2m_target_feature))%in%c(1:6),]

test_KO_30_2m_target_feature<-
  KO_30_2m_target_feature[year(rownames(KO_30_2m_target_feature))%in%c(2018) &      month(rownames(KO_30_2m_target_feature))%in%c(7:12),]



train_KO_60_2m_target_feature<-
  KO_60_2m_target_feature[year(rownames(KO_60_2m_target_feature))%in%c(2000:2017),]

validation_KO_60_2m_target_feature<-
  KO_60_2m_target_feature[year(rownames(KO_60_2m_target_feature))%in%c(2018) & month(rownames(KO_60_2m_target_feature))%in%c(1:6),]

test_KO_60_2m_target_feature<-
  KO_60_2m_target_feature[year(rownames(KO_60_2m_target_feature))%in%c(2018) &      month(rownames(KO_60_2m_target_feature))%in%c(7:12),]




train_KO_90_2m_target_feature<-
  KO_90_2m_target_feature[year(rownames(KO_90_2m_target_feature))%in%c(2000:2017),]

validation_KO_90_2m_target_feature<-
  KO_90_2m_target_feature[year(rownames(KO_90_2m_target_feature))%in%c(2018) & month(rownames(KO_90_2m_target_feature))%in%c(1:6),]

test_KO_90_2m_target_feature<-
  KO_90_2m_target_feature[year(rownames(KO_90_2m_target_feature))%in%c(2018) &      month(rownames(KO_90_2m_target_feature))%in%c(7:12),]



train_KO_30_3m_target_feature<-
  KO_30_3m_target_feature[year(rownames(KO_30_3m_target_feature))%in%c(2000:2017),]

validation_KO_30_3m_target_feature<-
  KO_30_3m_target_feature[year(rownames(KO_30_3m_target_feature))%in%c(2018) & month(rownames(KO_30_3m_target_feature))%in%c(1:6),]

test_KO_30_3m_target_feature<-
  KO_30_3m_target_feature[year(rownames(KO_30_3m_target_feature))%in%c(2018) &      month(rownames(KO_30_3m_target_feature))%in%c(7:12),]



train_KO_60_3m_target_feature<-
  KO_60_3m_target_feature[year(rownames(KO_60_3m_target_feature))%in%c(2000:2017),]

validation_KO_60_3m_target_feature<-
  KO_60_3m_target_feature[year(rownames(KO_60_3m_target_feature))%in%c(2018) & month(rownames(KO_60_3m_target_feature))%in%c(1:6),]

test_KO_60_3m_target_feature<-
  KO_60_3m_target_feature[year(rownames(KO_60_3m_target_feature))%in%c(2018) &      month(rownames(KO_60_3m_target_feature))%in%c(7:12),]




train_KO_90_3m_target_feature<-
  KO_90_3m_target_feature[year(rownames(KO_90_3m_target_feature))%in%c(2000:2017),]

validation_KO_90_3m_target_feature<-
  KO_90_3m_target_feature[year(rownames(KO_90_3m_target_feature))%in%c(2018) & month(rownames(KO_90_3m_target_feature))%in%c(1:6),]

test_KO_90_3m_target_feature<-
  KO_90_3m_target_feature[year(rownames(KO_90_3m_target_feature))%in%c(2018) &      month(rownames(KO_90_3m_target_feature))%in%c(7:12),]


#fun
train_KO_fun_1m_target_feature<-
  KO_fun_1m_target_feature[year(rownames(KO_fun_1m_target_feature))%in%c(2000:2017),]

validation_KO_fun_1m_target_feature<-
  KO_fun_1m_target_feature[year(rownames(KO_fun_1m_target_feature))%in%c(2018) & month(rownames(KO_fun_1m_target_feature))%in%c(1:6),]

test_KO_fun_1m_target_feature<-
  KO_fun_1m_target_feature[year(rownames(KO_fun_1m_target_feature))%in%c(2018) &      month(rownames(KO_fun_1m_target_feature))%in%c(7:12),]

train_KO_fun_2m_target_feature<-
  KO_fun_2m_target_feature[year(rownames(KO_fun_2m_target_feature))%in%c(2000:2017),]

validation_KO_fun_2m_target_feature<-
  KO_fun_2m_target_feature[year(rownames(KO_fun_2m_target_feature))%in%c(2018) & month(rownames(KO_fun_2m_target_feature))%in%c(1:6),]

test_KO_fun_2m_target_feature<-
  KO_fun_2m_target_feature[year(rownames(KO_fun_2m_target_feature))%in%c(2018) &      month(rownames(KO_fun_2m_target_feature))%in%c(7:12),]

train_KO_fun_3m_target_feature<-
  KO_fun_3m_target_feature[year(rownames(KO_fun_3m_target_feature))%in%c(2000:2017),]

validation_KO_fun_3m_target_feature<-
  KO_fun_3m_target_feature[year(rownames(KO_fun_3m_target_feature))%in%c(2018) & month(rownames(KO_fun_3m_target_feature))%in%c(1:6),]

test_KO_fun_3m_target_feature<-
  KO_fun_3m_target_feature[year(rownames(KO_fun_3m_target_feature))%in%c(2018) &      month(rownames(KO_fun_3m_target_feature))%in%c(7:12),]

#---------------------

train_AXP_30_1m_target_feature<-
  AXP_30_1m_target_feature[year(rownames(AXP_30_1m_target_feature))%in%c(2000:2017),]

validation_AXP_30_1m_target_feature<-
  AXP_30_1m_target_feature[year(rownames(AXP_30_1m_target_feature))%in%c(2018) & month(rownames(AXP_30_1m_target_feature))%in%c(1:6),]

test_AXP_30_1m_target_feature<-
  AXP_30_1m_target_feature[year(rownames(AXP_30_1m_target_feature))%in%c(2018) &      month(rownames(AXP_30_1m_target_feature))%in%c(7:12),]



train_AXP_60_1m_target_feature<-
  AXP_60_1m_target_feature[year(rownames(AXP_60_1m_target_feature))%in%c(2000:2017),]

validation_AXP_60_1m_target_feature<-
  AXP_60_1m_target_feature[year(rownames(AXP_60_1m_target_feature))%in%c(2018) & month(rownames(AXP_60_1m_target_feature))%in%c(1:6),]

test_AXP_60_1m_target_feature<-
  AXP_60_1m_target_feature[year(rownames(AXP_60_1m_target_feature))%in%c(2018) &      month(rownames(AXP_60_1m_target_feature))%in%c(7:12),]




train_AXP_90_1m_target_feature<-
  AXP_90_1m_target_feature[year(rownames(AXP_90_1m_target_feature))%in%c(2000:2017),]

validation_AXP_90_1m_target_feature<-
  AXP_90_1m_target_feature[year(rownames(AXP_90_1m_target_feature))%in%c(2018) & month(rownames(AXP_90_1m_target_feature))%in%c(1:6),]

test_AXP_90_1m_target_feature<-
  AXP_90_1m_target_feature[year(rownames(AXP_90_1m_target_feature))%in%c(2018) &      month(rownames(AXP_90_1m_target_feature))%in%c(7:12),]



train_AXP_30_2m_target_feature<-
  AXP_30_2m_target_feature[year(rownames(AXP_30_2m_target_feature))%in%c(2000:2017),]

validation_AXP_30_2m_target_feature<-
  AXP_30_2m_target_feature[year(rownames(AXP_30_2m_target_feature))%in%c(2018) & month(rownames(AXP_30_2m_target_feature))%in%c(1:6),]

test_AXP_30_2m_target_feature<-
  AXP_30_2m_target_feature[year(rownames(AXP_30_2m_target_feature))%in%c(2018) &      month(rownames(AXP_30_2m_target_feature))%in%c(7:12),]



train_AXP_60_2m_target_feature<-
  AXP_60_2m_target_feature[year(rownames(AXP_60_2m_target_feature))%in%c(2000:2017),]

validation_AXP_60_2m_target_feature<-
  AXP_60_2m_target_feature[year(rownames(AXP_60_2m_target_feature))%in%c(2018) & month(rownames(AXP_60_2m_target_feature))%in%c(1:6),]

test_AXP_60_2m_target_feature<-
  AXP_60_2m_target_feature[year(rownames(AXP_60_2m_target_feature))%in%c(2018) &      month(rownames(AXP_60_2m_target_feature))%in%c(7:12),]




train_AXP_90_2m_target_feature<-
  AXP_90_2m_target_feature[year(rownames(AXP_90_2m_target_feature))%in%c(2000:2017),]

validation_AXP_90_2m_target_feature<-
  AXP_90_2m_target_feature[year(rownames(AXP_90_2m_target_feature))%in%c(2018) & month(rownames(AXP_90_2m_target_feature))%in%c(1:6),]

test_AXP_90_2m_target_feature<-
  AXP_90_2m_target_feature[year(rownames(AXP_90_2m_target_feature))%in%c(2018) &      month(rownames(AXP_90_2m_target_feature))%in%c(7:12),]





train_AXP_30_3m_target_feature<-
  AXP_30_3m_target_feature[year(rownames(AXP_30_3m_target_feature))%in%c(2000:2017),]

validation_AXP_30_3m_target_feature<-
  AXP_30_3m_target_feature[year(rownames(AXP_30_3m_target_feature))%in%c(2018) & month(rownames(AXP_30_3m_target_feature))%in%c(1:6),]

test_AXP_30_3m_target_feature<-
  AXP_30_3m_target_feature[year(rownames(AXP_30_3m_target_feature))%in%c(2018) &      month(rownames(AXP_30_3m_target_feature))%in%c(7:12),]



train_AXP_60_3m_target_feature<-
  AXP_60_3m_target_feature[year(rownames(AXP_60_3m_target_feature))%in%c(2000:2017),]

validation_AXP_60_3m_target_feature<-
  AXP_60_3m_target_feature[year(rownames(AXP_60_3m_target_feature))%in%c(2018) & month(rownames(AXP_60_3m_target_feature))%in%c(1:6),]

test_AXP_60_3m_target_feature<-
  AXP_60_3m_target_feature[year(rownames(AXP_60_3m_target_feature))%in%c(2018) &      month(rownames(AXP_60_3m_target_feature))%in%c(7:12),]




train_AXP_90_3m_target_feature<-
  AXP_90_3m_target_feature[year(rownames(AXP_90_3m_target_feature))%in%c(2000:2017),]

validation_AXP_90_3m_target_feature<-
  AXP_90_3m_target_feature[year(rownames(AXP_90_3m_target_feature))%in%c(2018) & month(rownames(AXP_90_3m_target_feature))%in%c(1:6),]

test_AXP_90_3m_target_feature<-
  AXP_90_3m_target_feature[year(rownames(AXP_90_3m_target_feature))%in%c(2018) &      month(rownames(AXP_90_3m_target_feature))%in%c(7:12),]


#fun
train_AXP_fun_1m_target_feature<-
  AXP_fun_1m_target_feature[year(rownames(AXP_fun_1m_target_feature))%in%c(2000:2017),]

validation_AXP_fun_1m_target_feature<-
  AXP_fun_1m_target_feature[year(rownames(AXP_fun_1m_target_feature))%in%c(2018) & month(rownames(AXP_fun_1m_target_feature))%in%c(1:6),]

test_AXP_fun_1m_target_feature<-
  AXP_fun_1m_target_feature[year(rownames(AXP_fun_1m_target_feature))%in%c(2018) &      month(rownames(AXP_fun_1m_target_feature))%in%c(7:12),]

train_AXP_fun_2m_target_feature<-
  AXP_fun_2m_target_feature[year(rownames(AXP_fun_2m_target_feature))%in%c(2000:2017),]

validation_AXP_fun_2m_target_feature<-
  AXP_fun_2m_target_feature[year(rownames(AXP_fun_2m_target_feature))%in%c(2018) & month(rownames(AXP_fun_2m_target_feature))%in%c(1:6),]

test_AXP_fun_2m_target_feature<-
  AXP_fun_2m_target_feature[year(rownames(AXP_fun_2m_target_feature))%in%c(2018) &      month(rownames(AXP_fun_2m_target_feature))%in%c(7:12),]

train_AXP_fun_3m_target_feature<-
  AXP_fun_3m_target_feature[year(rownames(AXP_fun_3m_target_feature))%in%c(2000:2017),]

validation_AXP_fun_3m_target_feature<-
  AXP_fun_3m_target_feature[year(rownames(AXP_fun_3m_target_feature))%in%c(2018) & month(rownames(AXP_fun_3m_target_feature))%in%c(1:6),]

test_AXP_fun_3m_target_feature<-
  AXP_fun_3m_target_feature[year(rownames(AXP_fun_3m_target_feature))%in%c(2018) &      month(rownames(AXP_fun_3m_target_feature))%in%c(7:12),]


#---------------------



train_WFC_30_1m_target_feature<-
  WFC_30_1m_target_feature[year(rownames(WFC_30_1m_target_feature))%in%c(2000:2017),]

validation_WFC_30_1m_target_feature<-
  WFC_30_1m_target_feature[year(rownames(WFC_30_1m_target_feature))%in%c(2018) & month(rownames(WFC_30_1m_target_feature))%in%c(1:6),]

test_WFC_30_1m_target_feature<-
  WFC_30_1m_target_feature[year(rownames(WFC_30_1m_target_feature))%in%c(2018) &      month(rownames(WFC_30_1m_target_feature))%in%c(7:12),]



train_WFC_60_1m_target_feature<-
  WFC_60_1m_target_feature[year(rownames(WFC_60_1m_target_feature))%in%c(2000:2017),]

validation_WFC_60_1m_target_feature<-
  WFC_60_1m_target_feature[year(rownames(WFC_60_1m_target_feature))%in%c(2018) & month(rownames(WFC_60_1m_target_feature))%in%c(1:6),]

test_WFC_60_1m_target_feature<-
  WFC_60_1m_target_feature[year(rownames(WFC_60_1m_target_feature))%in%c(2018) &      month(rownames(WFC_60_1m_target_feature))%in%c(7:12),]




train_WFC_90_1m_target_feature<-
  WFC_90_1m_target_feature[year(rownames(WFC_90_1m_target_feature))%in%c(2000:2017),]

validation_WFC_90_1m_target_feature<-
  WFC_90_1m_target_feature[year(rownames(WFC_90_1m_target_feature))%in%c(2018) & month(rownames(WFC_90_1m_target_feature))%in%c(1:6),]

test_WFC_90_1m_target_feature<-
  WFC_90_1m_target_feature[year(rownames(WFC_90_1m_target_feature))%in%c(2018) &      month(rownames(WFC_90_1m_target_feature))%in%c(7:12),]





train_WFC_30_2m_target_feature<-
  WFC_30_2m_target_feature[year(rownames(WFC_30_2m_target_feature))%in%c(2000:2017),]

validation_WFC_30_2m_target_feature<-
  WFC_30_2m_target_feature[year(rownames(WFC_30_2m_target_feature))%in%c(2018) & month(rownames(WFC_30_2m_target_feature))%in%c(1:6),]

test_WFC_30_2m_target_feature<-
  WFC_30_2m_target_feature[year(rownames(WFC_30_2m_target_feature))%in%c(2018) &      month(rownames(WFC_30_2m_target_feature))%in%c(7:12),]



train_WFC_60_2m_target_feature<-
  WFC_60_2m_target_feature[year(rownames(WFC_60_2m_target_feature))%in%c(2000:2017),]

validation_WFC_60_2m_target_feature<-
  WFC_60_2m_target_feature[year(rownames(WFC_60_2m_target_feature))%in%c(2018) & month(rownames(WFC_60_2m_target_feature))%in%c(1:6),]

test_WFC_60_2m_target_feature<-
  WFC_60_2m_target_feature[year(rownames(WFC_60_2m_target_feature))%in%c(2018) &      month(rownames(WFC_60_2m_target_feature))%in%c(7:12),]




train_WFC_90_2m_target_feature<-
  WFC_90_2m_target_feature[year(rownames(WFC_90_2m_target_feature))%in%c(2000:2017),]

validation_WFC_90_2m_target_feature<-
  WFC_90_2m_target_feature[year(rownames(WFC_90_2m_target_feature))%in%c(2018) & month(rownames(WFC_90_2m_target_feature))%in%c(1:6),]

test_WFC_90_2m_target_feature<-
  WFC_90_2m_target_feature[year(rownames(WFC_90_2m_target_feature))%in%c(2018) &      month(rownames(WFC_90_2m_target_feature))%in%c(7:12),]





train_WFC_30_3m_target_feature<-
  WFC_30_3m_target_feature[year(rownames(WFC_30_3m_target_feature))%in%c(2000:2017),]

validation_WFC_30_3m_target_feature<-
  WFC_30_3m_target_feature[year(rownames(WFC_30_3m_target_feature))%in%c(2018) & month(rownames(WFC_30_3m_target_feature))%in%c(1:6),]

test_WFC_30_3m_target_feature<-
  WFC_30_3m_target_feature[year(rownames(WFC_30_3m_target_feature))%in%c(2018) &      month(rownames(WFC_30_3m_target_feature))%in%c(7:12),]



train_WFC_60_3m_target_feature<-
  WFC_60_3m_target_feature[year(rownames(WFC_60_3m_target_feature))%in%c(2000:2017),]

validation_WFC_60_3m_target_feature<-
  WFC_60_3m_target_feature[year(rownames(WFC_60_3m_target_feature))%in%c(2018) & month(rownames(WFC_60_3m_target_feature))%in%c(1:6),]

test_WFC_60_3m_target_feature<-
  WFC_60_3m_target_feature[year(rownames(WFC_60_3m_target_feature))%in%c(2018) &      month(rownames(WFC_60_3m_target_feature))%in%c(7:12),]




train_WFC_90_3m_target_feature<-
  WFC_90_3m_target_feature[year(rownames(WFC_90_3m_target_feature))%in%c(2000:2017),]

validation_WFC_90_3m_target_feature<-
  WFC_90_3m_target_feature[year(rownames(WFC_90_3m_target_feature))%in%c(2018) & month(rownames(WFC_90_3m_target_feature))%in%c(1:6),]

test_WFC_90_3m_target_feature<-
  WFC_90_3m_target_feature[year(rownames(WFC_90_3m_target_feature))%in%c(2018) &      month(rownames(WFC_90_3m_target_feature))%in%c(7:12),]


#fun
train_WFC_fun_1m_target_feature<-
  WFC_fun_1m_target_feature[year(rownames(WFC_fun_1m_target_feature))%in%c(2000:2017),]

validation_WFC_fun_1m_target_feature<-
  WFC_fun_1m_target_feature[year(rownames(WFC_fun_1m_target_feature))%in%c(2018) & month(rownames(WFC_fun_1m_target_feature))%in%c(1:6),]

test_WFC_fun_1m_target_feature<-
  WFC_fun_1m_target_feature[year(rownames(WFC_fun_1m_target_feature))%in%c(2018) &      month(rownames(WFC_fun_1m_target_feature))%in%c(7:12),]

train_WFC_fun_2m_target_feature<-
  WFC_fun_2m_target_feature[year(rownames(WFC_fun_2m_target_feature))%in%c(2000:2017),]

validation_WFC_fun_2m_target_feature<-
  WFC_fun_2m_target_feature[year(rownames(WFC_fun_2m_target_feature))%in%c(2018) & month(rownames(WFC_fun_2m_target_feature))%in%c(1:6),]

test_WFC_fun_2m_target_feature<-
  WFC_fun_2m_target_feature[year(rownames(WFC_fun_2m_target_feature))%in%c(2018) &      month(rownames(WFC_fun_2m_target_feature))%in%c(7:12),]

train_WFC_fun_3m_target_feature<-
  WFC_fun_3m_target_feature[year(rownames(WFC_fun_3m_target_feature))%in%c(2000:2017),]

validation_WFC_fun_3m_target_feature<-
  WFC_fun_3m_target_feature[year(rownames(WFC_fun_3m_target_feature))%in%c(2018) & month(rownames(WFC_fun_3m_target_feature))%in%c(1:6),]

test_WFC_fun_3m_target_feature<-
  WFC_fun_3m_target_feature[year(rownames(WFC_fun_3m_target_feature))%in%c(2018) &      month(rownames(WFC_fun_3m_target_feature))%in%c(7:12),]
#---------------------



