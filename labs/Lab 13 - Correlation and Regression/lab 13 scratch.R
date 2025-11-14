
library(tidyverse)

iris_small <- iris |>
  select(Sepal.Length, Sepal.Width) |>
  head(4)

x_bar <- mean(iris_small$Sepal.Length)
x_sd <- sd(iris_small$Sepal.Length)

y_bar <- mean(iris_small$Sepal.Width)
y_sd <- sd(iris_small$Sepal.Width)

cor(iris_small$Sepal.Length, iris_small$Sepal.Width)

