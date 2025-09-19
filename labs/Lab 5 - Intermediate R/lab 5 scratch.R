
library(tidyverse)

pulse_data_raw <- rio::import("http://www.statsci.org/data/oz/ms212.txt") 

head(pulse_data)
summary(pulse_data)
str(pulse_data)
psych::describe(pulse_data)

pulse_data <- pulse_data_raw |>
  mutate(PulseDiff = Pulse2 - Pulse1,
         Smokes = factor(Smokes, levels = c(1, 2), labels = c("Yes", "No")),
         Ran = factor(Ran, levels = c(1, 2), labels = c("Ran", "Sat"))) |>
  select(Smokes, Ran, Pulse1, Pulse2, PulseDiff)


pulse_data |>
  summarize(.by = Ran,
            PulseDiffMean = mean(PulseDiff, na.rm = T))

pulse_data |>
  summarize(.by = c(Ran, Smokes),
            PulseDiffMean = mean(PulseDiff, na.rm = T))


ggplot(data = pulse_data,
       mapping = aes(x = Pulse1, y = Pulse2, color = Ran)) +
  geom_point() +
  geom_smooth(method = "lm") +
  coord_cartesian(xlim = c(40, 180), ylim = c(40, 180)) +
  facet_wrap(~ Smokes) +
  theme_classic()
































