## This file contains 2 R functions which allow user to calculate the inverse of an input matrix

## This first function is useful to let R store in his cache memory the input matrix, get from the cache memory the input matrix, 
## store in cache memory the inverse matrix, get from cache the inverse matrix

makeCacheMatrix <- function(x = numeric()) {
## set the initial value of m
        m <- NULL
## refresh, if necessary, the input matrix 
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
## store the inverse matrix into m
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## The following function calculates the inverse matrix of an input matrix created with the above function. 
## This function first checks to see if the inverse matrix has already been calculated

cacheSolve <- function(x, ...) {
## get (if exists) the inverse matrix into m
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
## calculate the inverse matrix into m
        m <- solve(data, ...)
## store the inverse matrix into m
        x$setsolve(m)
        m
}
