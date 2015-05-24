## These functions are used to cache the inverse of a matrix
## and return from cache rather than solving again.


## makeCacheMatrix() takes a matrix as input and returns a list
## of functions to get or set the matrix inverse, using solve().
## To use this function, do: 
##      mc <- makeCacheMatrix(matrixname)

makeCacheMatrix <- function(x = matrix()) {
  bob <- NULL
  set <- function(y) {
    x <<- y
    bob <<- NULL
  }
  get <- function() x
  setinv <- function(solve) bob <<- solve
  getinv <- function() bob
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve() takes the list output from makeCacheMatrix and
## returns the inverse of the matrix from cache if available,
## or calls the get function from the list, puts the result in 
## the cache, and returns the inverse.
## To use cacheSolve(), do:
##     cacheSolve(mc)

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  joe <- x$getinv()
  if(!is.null(joe)) {
    message("getting cached data")
    return(joe)
  }
  xyz <- x$get()
  joe <- solve(xyz, ...)
  x$setinv(joe)
  joe
}
