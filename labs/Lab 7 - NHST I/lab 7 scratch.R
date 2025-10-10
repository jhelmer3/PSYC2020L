
library(tidyverse)

diamonds
head(diamonds)
nrow(diamonds)

summary(diamonds)

diamonds |>
  ggplot(mapping = aes(x = carat)) +
  geom_histogram(binwidth = .01) +
  scale_x_continuous(breaks = seq(0, 3, by = .1)) +
  coord_cartesian(xlim = c(0, 3))

diamonds |>
  ggplot(mapping = aes(x = y)) +
  geom_histogram() +
  coord_cartesian(ylim = c(0, 100))

diamonds |>
  filter(y < 3 | y > 20) |>
  arrange(y)
mean(diamonds$y)


ifelse(diamonds$y < 3 | diamonds$y > 20, NA, diamonds$y)

diamonds_clean <- diamonds |>
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

diamonds_clean |>
  ggplot(mapping = aes(x = y)) +
  geom_histogram() 

range(diamonds$y)
mean(diamonds_clean$y, na.rm = T)


diamonds_clean |>
  ggplot(mapping = aes(x = y)) +
  geom_histogram(color = "lightblue", linewidth = .1,
                 fill = "salmon", alpha = .5,
                 na.rm = T) 

diamonds |>
  select(cut, price)

diamonds |>
  ggplot(aes(x = cut, y = price)) +
  geom_violin() +
  geom_boxplot(width = .1)

diamonds |> pull(color) |> levels()  

fct_reorder(diamonds$color, diamonds$price, .desc = T)

diamonds |>
  ggplot(aes(x = cut, y = price)) +
  geom_violin(color = "pink", linewidth = 2, linetype = "dotted",
              fill = "salmon", alpha = .8) +
  geom_boxplot(width = .1, color = "blue", linewidth = .4,
               fill = NA, outliers = F, whisker.color = "white",
               notch = T) +
  coord_flip()


diamonds |>
  ggplot(aes(x = color, fill = cut)) +
  geom_bar(position = "fill")

diamonds |>
  ggplot(aes(x = carat, y = price, color = color)) +
  geom_point(alpha = .05, shape = 16) +
  guides(color = guide_legend(override.aes = list(alpha = 1, size = 5)))
















