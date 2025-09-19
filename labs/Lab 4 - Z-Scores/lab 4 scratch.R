

norm5 <- rnorm(5, mean = 0, sd = 1)

hist(rnorm(5000, mean = 0, sd = .5),
     xlim = c(-6, 6))

install.packages("rio")

here::here()

tdf_data <- read.csv(here::here("labs", "Lab 4 - Z-Scores", "tour_de_france.csv"))

tdf_data <- rio::import(here::here("labs", "Lab 4 - Z-Scores", "tour_de_france.csv"))



head(tdf_data)
summary(tdf_data)
names(tdf_data)

















