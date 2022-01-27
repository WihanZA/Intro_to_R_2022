## 20945043 Assignment 

## Task 1 


## Task 2 

knitr::opts_chunk$set(echo = TRUE, eval = TRUE, fig.height = 3.5, fig.width = 6)

library(pacman)
pacman::p_load(tidyverse, huxtable, fixest, urca)

## Task 3 

library(pacman)
pacman::p_load(tidyverse)

ts_data <- read.csv("data/ts_data.csv", header = T) %>% 
  dplyr::mutate(Year = as.Date(Year, format = "%Y-%m-%d")) %>% 
dplyr::filter(Year >= as.Date("1985-01-01"), Year <= as.Date("2010-01-01"), Country == "France") %>%
  arrange(Year)

pacman::p_load(urca)

test_vector <- ts_data %>% pull(ln_consump_pc)

my_ADF1 <- ur.df(
  y=test_vector, 
  type = "trend",
  lags = 5,
  selectlags = "AIC")

summary(my_ADF1)

## Task 4 

cs_data <- read.csv("data/cs_data.csv", header = T) 

pacman::p_load(fixest)
