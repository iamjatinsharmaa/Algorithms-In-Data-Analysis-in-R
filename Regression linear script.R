
# import the dataset into R
library(readr)
Auto <- read_csv("data/Auto.csv")

# examine correlation between continuous variables
cor(Auto$weight, Auto$mpg)

# fit a simple linear regression with one continuous predictor
lm_fit <- lm(mpg ~ weight, data = Auto)
summary(lm_fit)

# visualize fitted linear regression model
library(tidyverse)
Auto |> ggplot(aes(x = weight, y = mpg)) + geom_point() + geom_smooth(method = 'lm', se = FALSE)
