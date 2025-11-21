
library(tidyverse)
library(palmerpenguins)

iris_small <- iris |>
  select(Sepal.Length, Sepal.Width) |>
  head(4)

cor(iris_small$Sepal.Length, iris_small$Sepal.Width)

cor(iris_small)

iris |>
  select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) |>
  cor()


penguins

m0 <- lm(body_mass_g ~ 1, data = penguins)
summary(m0)

predict(m0)

m1 <- lm(body_mass_g ~ 1 + flipper_length_mm, data = penguins)
summary(m1)

summary(m1)$coefficients

summary(m1) |> str()

penguins |>
  select(flipper_length_mm) |>
  range(na.rm=T)

170:250

newdata <- data.frame(flipper_length_mm = 170:250)
predict(m1, newdata = newdata) # |> unname()


#predict(m1, newdata = data.frame(flipper_length_mm = 1000))

predicted_data <- data.frame(flipper_length_mm = 170:250) |>
  mutate(pred_body_mass = predict(m1,
                                  newdata = data.frame(flipper_length_mm)))

penguins |>
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_line(data = predicted_data,
            aes(y = pred_body_mass))

m2 <- lm(body_mass_g ~ flipper_length_mm + bill_length_mm,
         data = penguins)
summary(m2)

confint(m2)


























