
library(tidyverse)

qchisq(.95, df = 1)
qchisq(.95, df = 7 - 1)
qchisq(.95, df = 5 - 1)

qchisq(.95, df = 2)

major <- rio::import(here::here("labs", "Lab 12 - Chi-Squared Test", "major_data.csv"))


table(major$major, major$type)

table(major$major) |>
  as.data.frame()

table(major$major, major$type) |>
  as.data.frame()

major |>
  count(major, type) |>
  pivot_wider(names_from = type, values_from = n) |>
  select(-major) |>
  chisq.test(correct = F)

major |>
  ggplot(aes(x = major, fill = type)) +
  geom_bar(position = "dodge")

major |>
  count(major, type) |>
  ggplot(aes(x = major, y = n)) +
  geom_col()

studdat <- data.frame(type = c("Undergrad", "Graduate"),
                      `In-State` = c(25, 5),
                      `Out-of-State` = c(10, 10))
studdat |>
  select(-type) |>
  chisq.test(correct = F)

dat <- data.frame(student = 1:100,
                  major = sample(c("STEM", "Social Sciences", "Humanities", "Arts", "Business"),
                                 100, replace = T),
                  type = sample(c("STEM School", "Non-STEM School"), 100, replace = T))
