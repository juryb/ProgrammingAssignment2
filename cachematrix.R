## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
 m<-NULL
 set <- function (y){
     x <<- y
     m <<- NULL
 }
 get <- function () x
 setIn <-function (solve) m <<- solve
 getIn <- function() m
 list(set = set, get = get, setIn = setIn, getIn = getIn)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getIn()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m<- solve(data,...)
    x$setIn(m)
    m
}
