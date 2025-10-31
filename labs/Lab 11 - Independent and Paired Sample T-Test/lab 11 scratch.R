

library(tidyverse)

qt(.95, df = 3)
qt(.95, df = 37)

(1 - .95)/2
c((1 - .95)/2, (1 - .95)/2 + .95)
qt(c(.025, .975), df = 3)
qt(c(.025, .975), df = 37)

candy <- rio::import(here::here("labs", "Lab 11 - Independent and Paired Sample T-Test",
                                "candydata.csv"))

summary(candy)

candy$sales

# independent samples t-test

ccorn <- candy |>
  filter(candy == "candy corn") |>
  pluck("sales")
choc <- candy |>
  filter(candy == "chocolate") |>
  pluck("sales")

x_bar_ccorn <- mean(ccorn)
sd_ccorn <- sd(ccorn)
n_ccorn <- length(ccorn)

x_bar_choc <- mean(choc)
sd_choc <- sd(choc)
n_choc <- length(choc)

pooled_sd <- sqrt( ((n_ccorn - 1) * sd_ccorn^2 + (n_choc - 1) * sd_choc^2) /
                     ((n_ccorn - 1) + (n_choc - 1)))
sqrt( (sd_ccorn^2 + sd_choc^2) / 2 )

df <- (n_ccorn - 1) + (n_choc - 1)
qt(c(.025, .975), df = df)

t_stat <- (x_bar_ccorn - x_bar_choc) /
  (pooled_sd * sqrt(1 / n_ccorn + 1 / n_choc))


t.test(sales ~ candy, data = candy, var.equal = T)

# repeated measures t-test

pumpkin <- rio::import(here::here("labs", "Lab 11 - Independent and Paired Sample T-Test",
                                  "pumpkindata.csv")) |>
  mutate(diff = Oct31 - Oct1)

diff_mean <- mean(pumpkin$diff)
diff_sd <- sd(pumpkin$diff)
n_diff <- length(pumpkin$diff)

df <- n_diff - 1
qt(c(.025, .975), df = df)

t_stat <- diff_mean / (diff_sd / sqrt(n_diff))

t.test(pumpkin$Oct1, pumpkin$Oct31, var.equal = T, paired = T)



