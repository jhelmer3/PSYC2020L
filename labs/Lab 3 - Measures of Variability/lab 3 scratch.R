

10:100

c(1, 2, 3, 4, 5)

?seq

seq(1, 100, length.out = 5)

matrix(c(1, 2, 3,
         4, 5, 6),
       nrow = 2, byrow = T)

mymatrix <- matrix(c(0, 1, 2,
                     1, 2, 3,
                     2, 3, 4),
                   nrow = 3, byrow = T)
colnames(mymatrix) <- c("Var1", "Var2", "Var3")
mymatrix



mymatrix <- matrix(c(0, 1, 2,
                     1, 2, 3,
                     2, 3, 4),
                   nrow = 3, byrow = T,
                   dimnames = list(NULL,
                                   c("Var1", "Var2", "Var3")))
mymatrix


mydataframe <- data.frame(
  pet = c("cat", "dog"),
  count = c(2, 2))
mydataframe


myvector <- c(2, 4, 6, 8)
myvector[1]

myvector[c(1, 2, 4)]




mymatrix <- matrix(c(0, 1, 2,
                     5, 2, 3,
                     2, 3, 4),
                   nrow = 3, byrow = T)
mymatrix[4]

mydataframe["pet"]


scores <- c(85, 60, 45, 70, 50)
labels <- ifelse(scores >= 60,
                 "Pass", "Fail")


