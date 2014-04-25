hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
hilbert(8)
x<-makeCacheMatrix(hilbert(8))
cacheSolve(x)
cacheSolve(x)