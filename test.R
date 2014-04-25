# a function create a matrix object
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
# print hilbert(8)
hilbert(8)
# cache matrix
x<-makeCacheMatrix(hilbert(8))
# inverse matrix
cacheSolve(x)
# inverse matrix using cache
cacheSolve(x)