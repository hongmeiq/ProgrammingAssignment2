## Matrix inversion is usually a costly computation and their may be some benefit to caching 
## the inverse of a matrix rather than compute it repeatedly.  The pair of functions in this file
## will cache the inverse of a matrix.

## To test the functions, run code in test.R

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        # parameter x: a matrix object
        # variable inverse_x: inverse of the matrix x
        # always clean inverse_x variable before cache x
        inverse_x <- NULL
        # set function that sets x, and also cleans inverse_x
        set <- function(matrix_object) {
                x <<- matrix_object
                inverse_x <<- NULL
        }
        # get function that gets x
        get <- function() x
        # set_inverse_x function that sets inverse_x
        set_inverse_x <- function(inverse_matrix) inverse_x <<- inverse_matrix
        # get_inverse_x function that gets inverse_x
        get_inverse_x <- function() inverse_x
        list(set = set, get = get,
             set_inverse_x = set_inverse_x,
             get_inverse_x = get_inverse_x)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        result <- x$get_inverse_x()
        # if the inverse has already been calculated, then use the cached value
        if(!is.null(result)) {
                message("getting cached data")
                return(result)
        }
        data <- x$get()
        result <- solve(data, ...)
        x$set_inverse_x(result)
        result
}
