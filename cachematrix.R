## This code is modifed from the sample code provided in the example 
## "Caching the Mean of a Vector" from Coursera R Programming class.

## This script includes a pair of functions that together, compute
## and cache the inverse of a matrix.
##
##      1. makeCacheMatrix(): returns a "maxtrix" object which is 
##         actually a list of functions, each of which returns a matrix 
#          or matrix inverse.
##      2. cacheSolve: returns the inverse of the "matrix" returned by 
##         makeCacheMatrix(). If the inverse has already been calculated 
##         (and the matrix has not changed), then cachesolve() retreives 
##         the inverse from the cache.
##
## Matrix computations here assume the given matrix is square invertible.
#
## Additionally, an example function call is provided in the file 
##      test_cachematrix.R

makeCacheMatrix <- function(x = matrix()) {
        ## The function makeCacheMatrix returns a list containing functions that:
        ## -- set the value of the matrix
        ## -- get the value of the matrix
        ## -- set the inverse of the matrix
        ## -- get the inverse of the matrix
        
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

cacheSolve <- function(x, ...) {
        ## The function cacheSolve returns the inverse of the matrix returned by 
        ## makeCacheMatrix above. 
        
        # Get the matrix
        inv <- x$getinverse()
        
        # First check to see if the matrix inverse has already been calculated. 
        # If so, gets matrix inverse from the cache and skips the computation.
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        
        # Otherwise, calculate the matrix inverse and set the value in the 
        # cache via the setinverse() function.
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
