library(pacman)
pacman::p_load(tidyverse)

data1 <- read.csv(file = "data/ts_data.csv", header=TRUE)
data1<- data1 %>% mutate(Year = as.Date(Year, format = "%Y-%m-%d")) %>% dplyr::filter(Year >= as.Date("1985-01-01"),
                                                                                      Year <= as.Date("2010-01-01"), 
                                                                                      Country == "France")


pacman::p_load(urca)

# Currently, Energy_Consumption is still a data frame and y should be a vector
test_vector <- data1 %>% pull(ln_consump_pc)

my_ADF1 <- ur.df(
  y = test_vector, # vector
  type = "trend", # type of ADF - trend + constant
  lags = 5, # max lags
  selectlags = "AIC" # lag selection criteria
)

summary(my_ADF1)
