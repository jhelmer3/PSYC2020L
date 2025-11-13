
library(tidyverse)

qchisq(p = .95, df = 1)

qchisq(.95, df = 6)

qchisq(.95, df = 4)


chisq_stat <- (65 - 20)^2 / 20 +
  (10 - 20)^2 / 20 +
  (5 - 20)^2 / 20 +
  (5 - 20)^2 / 20 +
  (15 - 20)^2 / 20
chisq_stat

obs <- c(65, 10, 5, 5, 15)
chisq.test(obs)

majordat <- data.frame(major = c("STEM", "Social.Sciences", "Humanities", "Arts", "Business"),
                       observed = c(65, 10, 5, 5, 15))

chisq <- majordat |>
  select(observed) |>
  chisq.test()
chisq
chisq$statistic

obs
chisq.test(obs, 
           p = c(60, 10, 10, 10, 10),
           rescale.p = T)

qchisq(.95, df = (3 - 1) * (2 - 1))
qchisq(.95, df = 2)

chisq_stat_2 <- (25 - 21)^2 / 21 +
  (10 - 14)^2 / 14 +
  (5 - 9)^2 / 9 + 
  (10 - 6)^2 / 6
qchisq(.95, df = (2 - 1) * (2 - 1))

data.frame(type = c("Undergrad", "Grad"),
           in_state = c(25, 5),
           out_of_state = c(10, 10)) -> stud_data

stud_data |>
  select(-type) |>
  chisq.test(correct = F)


major <- rio::import(here::here("labs",
                                "Lab 12 - Chi-Squared Test",
                                "major_data.csv"))

table(major$major) |>
  chisq.test()

table(major$major) |>
  data.frame()

table(major$major, major$type) |>
  data.frame()

table(major$major, major$type) |>
  chisq.test()

major |>
  summarise(.by = c(major, type),
            n = n()) |>
  arrange(major, type)


major |>
  count(major, type) |>
  pivot_wider(names_from = type, values_from = n) |>
  select(-major) |>
  chisq.test()

major |>
  ggplot(aes(x = major)) +
  geom_bar()

major |>
  summarise(.by = c(major, type),
            n = n()) |>
  arrange(major, type) |>
  ggplot(aes(x = major, y = n)) +
  geom_col()

major |>
  ggplot(aes(x = major, fill = type)) +
  geom_bar(position = "fill")

major |>
  ggplot(aes(x = major, fill = type)) +
  geom_bar(position = "dodge")


leaves <- rio::import(here::here("labs",
                                 "Lab 12 - Chi-Squared Test", 
                                 "leaves.csv"))


table(leaves$color) |>
  chisq.test()






