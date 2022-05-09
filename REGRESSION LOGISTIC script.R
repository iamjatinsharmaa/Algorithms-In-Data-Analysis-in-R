
# import file into R
library(tidyverse)
cardio_CVDs <- read_csv("data/cardio_CVDs.csv")

# standardize continuous variables and convert categorical variables to factor data type 
cardio_CVDs <- cardio_CVDs |> mutate(across(c(age, weight), ~c(scale(.x))),
                                     across(c(gender, cholesterol:cardio), as.factor))

# fit a logistic regression model and print the model summary
logreg_fit <- glm(cardio ~ ., data = cardio_CVDs, family = binomial(link = 'logit'))
summary(logreg_fit)
