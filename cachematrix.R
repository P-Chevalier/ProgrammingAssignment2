## This set of R functions will cache a potentially time-consumming computation - in this 
## case - storing the results of an inverted matrix, so that the computation could be used 
## over and over without having to recompute it.
##
## The first function will create the matrix object and the second function will
## compute the the inverse of the matrix - if needed (not already in cache or altered).  

##
## cachematrix.R
## date created: 2015-05-15
##

## Usage:
## source("cachematrix.R")
## f<-makeCacheMatrix()
## f$set(matrix(c(10,20,30,40),nrow=2,ncol=2))
## First time through
## > cacheSolve(f)
## [,1]  [,2]
## [1,] -0.2  0.15
## [2,]  0.1 -0.05
## 
## Second time through
## > cacheSolve(f)
## getting cached data
## [,1]  [,2]
## [1,] -0.2  0.15
## [2,]  0.1 -0.05

# The makeCacheMatrix function is designed to create a special "matrix" object that can 
# have it's inverse cached.
makeCacheMatrix <- function(x = matrix()) {
        # initialize m to NULL
        m <- NULL
        
        # set the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        # get the matrix
        get <- function() x
        
        # set the inverse matrix
        setinverse <- function(solve) m <<- solve
        
        # get the inverse matrix
        getinverse <- function() m
        
        # create a list of functions
        list(set = set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}

# The cacheSolve function is designed to compute the inverse of the special "matrix" 
# returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
        # Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        
        # check to see if an inverted matrix exists 
        # if it does then return the cached data
        if(!is.null(m)) {
                # let user know that a cached copy is being returned
                message("getting cached data")
                return(m)
        }
        
        # or else continue and create an inverse matrix
        # get the matrix data
        data <- x$get()
        
        # set the inverse matrix
        m <- solve(data, ...)
        
        # set the inverse matrix into cache
        x$setinverse(m)
        
        # print the matrix
        m
}
