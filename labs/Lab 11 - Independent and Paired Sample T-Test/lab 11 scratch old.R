
library(tidyverse)

qt(.95, df = 3)
qt(.95, df = 37)

c((1-.95)/2, .95 + (1-.95)/2)

qt(c(.025, .975), df = 3)
qt(c(.025, .975), df = 37)

candy <- rio::import(here::here("labs", "Lab 11 - Independent and Paired Sample T-Test", "candydata.csv"))

summary(candy)

ccorn <- candy |>
  filter(candy == "candy corn") |>
  pluck("sales")

choc <- candy |>
  filter(candy == "chocolate") |>
  pluck("sales")

x_bar_ccorn <- mean(ccorn)
x_bar_choc <- mean(choc)

n_ccorn <- length(ccorn)
n_choc <- length(choc)

sd_ccorn <- sd(ccorn)
sd_choc <- sd(choc)

s_pooled <- sqrt( ((n_ccorn - 1) * sd_ccorn^2 + (n_choc - 1) * sd_choc^2) /
                    (n_ccorn + n_choc - 2))
# or
s_pooled <- sqrt( (sd_ccorn^2 + sd_choc^2) / 2 )

df <- n_ccorn + n_choc - 2
qt(c(.025, .975), df = df)

t_stat <- (x_bar_ccorn - x_bar_choc) / (s_pooled * sqrt(1 / n_ccorn + 1 / n_choc))

t.test(sales ~ candy, data = candy, var.equal = T)$statistic |> unname() # to get rid of the number naming

pumpkin <- rio::import(here::here("labs", "Lab 11 - Independent and Paired Sample T-Test", "pumpkindata.csv")) |>
  mutate(diff = Oct31 - Oct1)

mean_diff <- mean(pumpkin$diff)
sd_diff <- sd(pumpkin$diff)
n_diff <- length(pumpkin$diff)

df <- n_diff - 1
qt(c(.025, .975), df)

t_stat <- (mean_diff - 0) / (sd_diff / sqrt(n_diff))

t.test(pumpkin$Oct1, pumpkin$Oct31, var.equal = T, paired = T)

(x_bar_ccorn - x_bar_choc) / s_pooled



















