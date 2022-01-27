library(pacman)
pacman::p_load(tidyverse, huxtable, fixest, urca)

##Task 3
ts_data <- read.csv(file = "data/ts_data.csv", header = TRUE)
ts_data <- ts_data %>% mutate(Year = as.Date(Year, format = "%Y-%m-%d"))
 dplyr::filter(Year >= as.Date("1985-01-01"), Year <= as.Date("2010-01-01"))
ts_data <- ts_data %>% dplyr::filter(Year >= as.Date("1985-01-01"), Year <= "2010-01-01") 
test_vector <- ts_data %>% pull(ln_consump_pc)
my_ADF1 <- ur.df(
  y = test_vector, 
  type = "trend", 
  lags = 5, 
  selectlags = "AIC" 
)

summary(my_ADF1) # If needed

## Task 4 
cs_data <- read.csv(file = "data/cs_data.csv", header = TRUE)
model1 <- feols(wage ~ x1, data = cs_data)
model2 <- feols(wage ~ x1 + x2, data = cs_data)
model3 <- feols(wage ~ x1 + x2 + i(treat), data = cs_data)
huxreg(model1, model2, model3)
