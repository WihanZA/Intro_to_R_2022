##TASK 1 & 2

library(pacman)

pacman::p_load(fixest, tidyverse, huxtable, hrbrthemes, modelsummary, glue, urca)

library(readr)

ts_df <- read.csv("data/ts_data.csv", header=TRUE) %>%
  mutate(Year=as.Date(Year,format="%Y-%m-%d"))%>%
  dplyr::filter(Year>=as.Date("1985-01-01"), Year<=as.Date("2010-01-01"), Country=="France")%>%
  arrange(Year)

##TASK 3

pacman::p_load(stats)
test_vector <- ts_df %>% pull(ln_consump_pc)



ADF1 <- ur.df(y=test_vector, type="trend", lags=5,selectlags="AIC")

summary(ADF1)

