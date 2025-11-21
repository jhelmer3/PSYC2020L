
library(tidyverse)
library(palmerpenguins)

penguins |>
  select(species, flipper_length_mm) |>
  head()

penguins |>
  select(species, flipper_length_mm) |>
  summary()

penguin_aov <- aov(flipper_length_mm ~ species,
                   data = penguins)
summary(penguin_aov)

sum(!is.na(penguins$flipper_length_mm))

penguins |>
  ggplot(aes(x = species, y = flipper_length_mm, fill = species)) +
  geom_violin(color = NA) +
  geom_boxplot(width = .2) +
  stat_summary(geom = "point", fun = mean,
               size = 3)
















