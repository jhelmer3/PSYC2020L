
#install.packages("psych")
install.packages("tidyverse")

library(tidyverse)

pulse_data_raw <- rio::import("http://www.statsci.org/data/oz/ms212.txt") 

head(pulse_data_raw)
summary(pulse_data_raw)
str(pulse_data_raw)
psych::describe(pulse_data_raw)

pulse_data <- pulse_data_raw |>
  mutate(PulseDiff = Pulse2 - Pulse1,
         SmokesFct = factor(Smokes, levels = c(1, 2), labels = c("Yes", "No")),
         RanFct = factor(Ran, levels = c(1, 2), labels = c("Ran", "Sat")),
         ExerciseFct = factor(Exercise, levels = c(1, 2, 3), labels = c("High", "Moderate", "Low"))) |>
  select(SmokesFct, RanFct, ExerciseFct, PulseDiff, Pulse1, Pulse2)


pulse_data |>
  summarize(.by = RanFct,
            PulseDiffMean = mean(PulseDiff, na.rm = T))

pulse_data |>
  summarize(.by = c(RanFct, SmokesFct),
            PulseDiffMean = mean(PulseDiff, na.rm = T))



ggplot(pulse_data,
       mapping = aes(x = Pulse1, y = Pulse2, color = RanFct)) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(40, 180), ylim = c(40, 180)) +
  facet_wrap(~ SmokesFct) +
  theme_classic()

pulse_data |>
  filter(SmokesFct == "No" & RanFct == "Ran")

pulse_data |>
  filter(SmokesFct == "No") |>
  filter(RanFct == "Ran")


































