## This is code for testing the script cachematrix.R
## It is modelled after a test script for cachemean() function 
## posted to the Coursera forums by student Adam Gruer.

## ---------------
source('~/Code/DataAnalysis/Coursera/RProgramming/ProgrammingAssignment2/cachematrix.R')

## Call  the makeCacheMatrix() function and assign its return 
## value (a list of four functions) to a variable, m
## m is now a list of four functions
m <- makeCacheMatrix()

## use m's set function to create the 4 x 4 identity matrix 
m$set(diag(4))

## use m's get function to retrieve the matrix created 
m$get()

## pass the matrix m to the cacheSolve() function
## the inverse of the identity matrix (i.e. also the identity matrix) 
## should be returned
cacheSolve(m)

## now pass the matrix m to the cacheSolve() function a second time
## the identity matrix should be returned along with a message "retrieving 
## value from cache" indicating that the inverse is not being calculated this 
## time but is being retrieved from the cached value
cacheSolve(m)

## use m's set function to create a new matrix
## containing numbers from a random normal distribution
m$set(matrix(rnorm(16), 4, 4))

## pass the matrix m to the cacheSolve() function
## the inverse should be returned (and it is very low probability
## that the matrix is not invertible)
cacheSolve(m)

## pass the matrix m to the cacheSolve() function a second time
## the inverse matrix should be returned along with a message
## "retrieving value from cache" indicating that the inverse
## is not being calculated this time but is being retrieved from cache
cacheSolve(m)
