## Task 2
library(pacman)
pacman::p_load(tidyverse, huxtable, fixest, urca)

## Task 3
library(pacman)
pacman::p_load(tidyverse)

ts_data <- read.csv(file = "Data/ts_data.csv", header= TRUE) %>% 
                    
    mutate(Year = as.Date(Year, format = "%Y-%m-%d")) %>%
    dplyr::filter(Year >= as.Date("1985-01-01"), Year <= as.Date("2010-01-01"),
                  Country == "France")


pacman::p_load(urca) 
test_vector <- ts_data %>% pull(ln_consump_pc)

my_ADF1 <- ur.df(
  y = test_vector, 
  type = "trend", 
  lags = 5, 
  selectlags = "AIC"
)

summary(my_ADF1) 

##Task 4
cs_data <- read.csv(file = "Data/cs_data.csv", header= TRUE)

pacman::p_load(fixest, huxtable)

model1 <- feols(wage ~ x1, data = cs_data)
model2 <- feols(wage ~ x1 + x2, data = cs_data)
model3 <- feols(wage ~ x1 + x2 + i(treat), data = cs_data)

huxreg(model1, model2, model3)