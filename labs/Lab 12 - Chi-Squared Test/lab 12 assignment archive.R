|        | No  | Yes | Total |
  |--------|-----|-----|-------|
  | Green  |     |     | 104   |
  | Red    |     |     | 289   |
  | Orange |     |     | 513   |
  | Brown  |     |     | 94    |
  | Total  | 584 | 416 | 1000  |
  
  ```{r}
#| include: false
data.frame(color = sample(c("green", "red", "orange", "brown"),
                          size = 200, replace = T,
                          prob = c(.1, .3, .5, .1)))

leaves <- data.frame(prob = rnorm(1000)) |>
  mutate(color = case_when(prob < qnorm(.1) ~ "green",
                           prob < qnorm(.4) ~ "red",
                           prob < qnorm(.9) ~ "orange",
                           prob < qnorm(1) ~ "brown") |>
           factor(levels = c("green", "red", "orange", "brown"))) |>
  mutate(.by = color,
         fallen = case_when(color == "green" ~ sample(c("no", "yes"), n(), replace = T, prob = c(.9, .1)),
                            color == "red" ~ sample(c("no", "yes"), n(), replace = T, prob = c(.7, .3)),
                            color == "orange" ~ sample(c("no", "yes"), n(), replace = T, prob = c(.5, .5)),
                            color == "brown" ~ sample(c("no", "yes"), n(), replace = T, prob = c(.3, .7)))) |>
  select(-prob)

leaves <- rio::import(here::here("labs", "Lab 12 - Chi-Squared Test", "leaves.csv"))
```