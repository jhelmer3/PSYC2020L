
library(tidyverse)

(1-.95)/2
c(.025, .95 + .025)
qnorm(c(.025, .95 + .025))

(1-.973)/2
c(.0135, .973 + .0135)
qnorm(c(.0135, .973 + .0135))

qnorm(c((1-.973)/2, .973 + (1-.973)/2))


head(iris$Petal.Length)

x_bar <- mean(iris$Petal.Length)
x_sd <- sd(iris$Petal.Length)
n <- length(iris$Petal.Length)
z_cutoff <- qnorm(.975)

x_se <- x_sd / sqrt(n)
c(x_bar - z_cutoff * x_se, x_bar + z_cutoff * x_se)
c(x_bar + qnorm(.025) * x_se, x_bar + qnorm(.975) * x_se)


head(iris$Sepal.Length)

(1-.8)/2 + .8 # getting cutoff

c(mean(iris$Sepal.Length) - qnorm(.9) * (sd(iris$Sepal.Length) /
                                          sqrt(length(iris$Sepal.Length))),
  mean(iris$Sepal.Length) + qnorm(.9) * (sd(iris$Sepal.Length) /
                                          sqrt(length(iris$Sepal.Length))))

c(mean(iris$Sepal.Length) - qnorm(.9) * sd(iris$Sepal.Length) /
    sqrt(sum(!is.na(iris$Sepal.Length))),
  
  mean(iris$Sepal.Length) + qnorm(.9) * sd(iris$Sepal.Length) /
    sqrt(sum(!is.na(iris$Sepal.Length))))

head(mpg)
head(mpg$hwy)
summary(mpg$hwy)

x_bar <- mean(mpg$hwy)
x_sd <- sd(mpg$hwy)
n <- length(mpg$hwy)
nrow(mpg)

x_se <- x_sd / sqrt(n)

t_hwy_stat <- (x_bar - 30) / x_se

t.test(mpg$hwy, mu = 30, alternative = "two.sided")

head(mpg$cty)
t.test(mpg$cty, mu = 30, alternative = "less")


hwy_ttest <- t.test(mpg$hwy, mu = 30, alternative = "two.sided")
hwy_ttest$statistic


x_bar <- mean(mpg$hwy)
x_sd <- sd(mpg$hwy)

hwy_cohens_d <- (x_bar - 30) / x_sd

## pre-class
library(tidyverse)

.025
.95+.025
qnorm(c(.025, .975))

qnorm(c((1-.95)/2, (1-.95)/2 + .95))

conflevel <- .95
qnorm(c((1 - conflevel) / 2,
        (1 - conflevel) / 2 + conflevel))


conflevel <- .973
qnorm(c((1 - conflevel) / 2,
        (1 - conflevel) / 2 + conflevel))



head(iris$Petal.Length)

x_bar <- mean(iris$Petal.Length)  
x_sd <- sd(iris$Petal.Length)
n <- length(iris$Petal.Length)

x_se <- x_sd / sqrt(n) 

z_cutoff <- qnorm(.975)

c(x_bar - z_cutoff * x_se, x_bar + z_cutoff * x_se)
c(x_bar + qnorm(.025) * x_se, x_bar + qnorm(.975) * x_se)


# one tailed t cutoff

qt(.95, df = 3)
qt(.05, df = 3, lower.tail = F)

qt(.95, df = 37)

# two-tailed t-cutoff

c(.025, .975)
qt(c(.025, .975), df = 3)
qt(c(.025, .975), df = 37)


# one-sample t-test

head(mpg)
head(mpg$hwy)

x_bar <- mean(mpg$hwy)
x_sd <- sd(mpg$hwy)
n <- length(mpg$hwy)

df <- n - 1
qt(c(0.025, .975), df = df)

t_stat <- (x_bar - 30) / (x_sd / sqrt(n))

t.test(mpg$hwy, mu = 30)

t.test(mpg$cty, mu = 30, alternative = "less")

hwytest <- t.test(mpg$hwy, mu = 30)
hwytest$p.value

hwytest$statistic
hwytest |> pluck("statistic")


x_bar <- mean(mpg$hwy)
x_sd <- sd(mpg$hwy)

cohens_d <- (x_bar - 30) / x_sd

mytest <- t.test(iris$Sepal.Length)

mytest$statistic |> unname()








