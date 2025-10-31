
#install.packages("ggrepel")
#install.packages("geomtextpath")

library(tidyverse)

head(mpg)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE)


mpg_labels <- mpg |>
  summarize(.by = drv,
            hwy = mean(hwy),
            displ = mean(displ)) |>
  mutate(drv_label = case_when(drv == "4" ~ "four wheel drive",
                               drv == "f" ~ "front wheel drive",
                               drv == "r" ~ "rear wheel drive"))

grades <- rnorm(10, 90, 10)
grades

case_when(grades < 60 ~ "F",
          grades < 70 ~ "D",
          grades < 80 ~ "C",
          grades < 90 ~ "B",
          .default = "default")

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_text(data = mpg_labels,
            aes(label = drv_label),
            size = 6, hjust = .5, vjust = "top",
            fontface = "italic")

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  ggrepel::geom_label_repel(data = mpg_labels,
            aes(label = drv_label)) +
  theme(legend.position = "none")


mpg |>
  mutate(drv_label = case_when(drv == "4" ~ "four wheel drive",
                               drv == "f" ~ "front wheel drive",
                               drv == "r" ~ "rear wheel drive")) |>
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geomtextpath::geom_textsmooth(aes(label = drv_label), se = FALSE,
                                size = 5, hjust = .5) 

mpg |>
  mutate(drv_label = case_when(drv == "4" ~ "four wheel drive",
                               drv == "f" ~ "front wheel drive",
                               drv == "r" ~ "rear wheel drive")) |>
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_text(aes(label = drv_label))



ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

potential_outliers <- mpg |>
  filter(hwy > 40 | (hwy > 20 &  displ > 5))
potential_outliers

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(data = potential_outliers,
             color = "red") +
  geom_point(data = potential_outliers,
             color = "red", shape = "circle open", size = 3) +
  ggrepel::geom_label_repel(data = potential_outliers,
                            aes(label = model),
                            size = 2)


ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(data = filter(mpg, class == "2seater"),
             color = "skyblue3") +
  geom_segment(data = filter(mpg, class == "2seater"),
               aes(xend = displ + .05, x = 6.6,
                   yend = hwy + .05, y = 29),
               arrow = arrow(angle = 20, length = unit(.1, "inches")),
               color = "skyblue3") +
  annotate("text", x = 6.6, y = 30, label = "two-seaters",
           size = 5, hjust = "center",
           color = "skyblue3") +
  geomtextpath::geom_texthline(aes(yintercept = mean(hwy)),
                               label = "hwy sample mean", size = 6) +
  theme_classic()


trend_text <- "Larger engine sizes tend to have lower fuel economy." |>
  str_wrap(width = 30)
trend_text

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  annotate(geom = "text", label = trend_text,
           x = 3.5, y = 40, hjust = 0) +
  annotate("segment", x = 3, xend = 5,
           y = 35, yend = 27, arrow = arrow(type = "closed"),
           color = "red")
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


