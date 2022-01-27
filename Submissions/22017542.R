library(pacman)
pacman::p_load(tidyverse, urca)
ts_df <- read.csv(file ="data/ts_data.csv")
ts_df <- ts_df %>% mutate(Year= as.Date(Year, format="%Y-%m-%d")) %>% 
dplyr::filter(Year >= as.Date("1985-01-01"), Year <=as.Date("2010-01-01"), Country== "France") %>% 
arrange(Year)

test_vector <- ts_df %>% pull(ln_consump_pc)
my_ADF1 <- ur.df(
  y = test_vector, 
  type = "trend",
  lags = 5, 
  selectlags = "AIC")

summary(my_ADF1)

library(pacman)
pacman::p_load(fixest, urca)
cs_df <- read.csv(file ="data/cs_data.csv")
view(cs_df)

model1 <- feols(wage ~ x1, data = cs_df)
summary(model1)
model2 <- feols(wage ~ x1 + x2, data = cs_df)
summary(model2)
model3 <- feols(wage ~ x1 + x2 + i(treat), data = cs_df)
summary(model3)
pacman::p_load(huxtable)
huxreg(model1, model2, model3)
