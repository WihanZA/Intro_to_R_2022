library(pacman)
pacman::p_load(tidyverse, urca, huxtable, fixest)
ts_df <- read.csv("Data/ts_data.csv") %>%
 mutate(Year= as.Date(Year, format = "%Y-%m-%d")) %>%
 dplyr::filter(Year >= as.Date("1985-01-01"), Year <= as.Date("2010-01-01"),
               Country == "France")%>%
  arrange(Year)

#Task 3 ADF Test

Consumption_df <- ts_df %>% dplyr::select(ln_consump_pc) 
consumption_vector <- Consumption_df %>% pull(ln_consump_pc)

my_ADF3 <- ur.df(
  y = consumption_vector,
  type = "trend",
  lags = 5,
  selectlags = "AIC"
)

summary(my_ADF3)


##Task 4 
cs_df <- read.csv("Data/cs_data.csv")
model1 <- feols(wage ~ x1, data = cs_df)
model2 <- feols(wage ~ x1 + x2, data = cs_df)
model3 <- feols(wage ~ x1 + x2 + i(treat), data = cs_df)

huxreg("Model1" = model1, "Model2"= model2, "Model3" = model3,
       statistics = c("N" = "nobs", "R-squared" = "r.squared"),
       stars = c(`*`= 0.1, `**` = 0.05, `***` = 0.01, `****` = 0.001),
       number_format = 2
       ) %>%
  set_font_size(9)