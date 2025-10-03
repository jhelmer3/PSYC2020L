
library(tidyverse)


diamonds
head(diamonds)


diamonds |>
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = .01) +
  coord_cartesian(xlim = c(0, 3))

diamonds |>
  ggplot(aes(x = y)) +
  geom_histogram(binwidth = .5) +
  coord_cartesian(ylim = c(0, 100))

range(diamonds$y)

diamonds |>
  filter(y < 3 | y > 20) |>
  arrange(y)

summary(diamonds)

diamonds_clean <- diamonds |>
  mutate(y = ifelse(y == 0 | y > 20, NA, y))

diamonds_clean |>
  ggplot(aes(x = y)) +
  geom_histogram(bins = 20, na.rm = T,
                 color = "lightpink", fill = "lightblue3",
                 linewidth = 2, alpha = .5) 

diamonds |>
  select(price, cut, color) |>
  str()

diamonds |>
  ggplot(aes(y = price, x = fct_reorder(cut, price, .desc = T))) +
  geom_violin(color = "salmon", fill = "lightpink", linewidth = .3,
              alpha = .6, linetype = "dashed") +
  geom_boxplot(width = .1, color = "salmon", fill = "white", alpha = .3,
               outliers = F, whisker.colour = NA, notch = T) +
  coord_flip()

diamonds |> 
  ggplot(aes(x = color, fill = cut)) +
  geom_bar(position = "fill")

diamonds |>
  ggplot(aes(x = carat, y = price, color = color)) +
  geom_point(alpha = .05, shape = 16) +
  guides(color = guide_legend(override.aes = list(alpha = 1, size = 4)))
























