

head(iris)

n_length <- length(iris$Petal.Length)
xbar_length <- mean(iris$Petal.Length)
mu_length <- 4
sd_length <- sqrt(4)
se_length <- sd_length / sqrt(n_length)

z_length <- (xbar_length - mu_length) / se_length


z_width <- (mean(iris$Petal.Width) - 3) /
  (sqrt(4) / sqrt(length(iris$Petal.Width)))

pnorm(z_width)







