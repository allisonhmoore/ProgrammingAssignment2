## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list containing a function to:
## -- set the value of the matrix
## -- get the value of the matrix
## -- set the inverse of the matrix
## -- get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve computes the inverse of the matrix returned by makeCacheMatrix above. 
## It first checks to see if the matrix inverse has already been calculated. 
## If so, it gets the matrix inverse from the cache and skips the computation. 
## Otherwise, it calculates the matrix inverse and sets the value in the cache
## via the setinverse function.
##
## Matrix computations here assume the given matrix is square invertible.

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
