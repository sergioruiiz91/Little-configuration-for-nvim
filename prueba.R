library(ggplot2)
f <- function(x) {
  x <- x + 1
  return(x)
}
x <- 1:10
y <- 1:10
df <- data.frame(c(x, y))
df
f(4)
