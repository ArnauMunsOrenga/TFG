library(CombMSC)
library(randomForest)
library(quantmod)
library(TTR)
library(tidyverse)
library(caret)
library(foreach)

getSymbols(Symbols = "KO", from ="2000-01-01",to="2018-12-31")
getSymbols(Symbols = "WFC", from ="2000-01-01",to="2018-12-31")
getSymbols(Symbols = "AAPL", from ="2000-01-01",to="2018-12-31")
getSymbols(Symbols = "AXP", from ="2000-01-01",to="2018-12-31")


