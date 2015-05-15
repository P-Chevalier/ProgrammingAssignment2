## This R function will cache a potentially time-consumming computation - in this case
## storing the results of an inverted matrix, so that the computation could be used over 
## and over without recomputing it.
##
## The first function will create the matrix object and the second function will
## compute the the inverse of the matrix - if needed (not already in cache or altered).  

##
## cachematrix.R
## date created: 2015-05-15
##

## The makeCacheMatrix function is designed to create 
## a special "matrix" object that can have it's 
## inverse cached.
makeCacheMatrix <- function(x = matrix()) {
        
}


## The cacheSolve function is designed to compute 
## the inverse of the special "matrix" returned by 
## makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
}
