## These functions would make a matrix object that can cache its inverse; assuming that the matrix supplied would always be invertible.
## If the inverse of the matrix created has been calculated and the matrix has not changed, the cacheSolve would be able to retrieve the inverse straight from the cache.
 
## makeCacheMatrix would create a special "matrix" that is able to cache its own inverse. 

makeCacheMatrix <- function(x = matrix()){
   inv <- NULL
   set <- function(y){
      x <<- y 
      inv <<- NULL
}
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The cacheSolve function would display the inverse of the matrix called from the cache if it exists previously and the matrix has not changed. 
## If it does not exist, the solve() function would be called to get the inverse of the matrix and save it in the cache. 

cacheSolve <- function(x,...){
   inv <- x$getInverse()
   if (!is.null(inv)){ 
message("getting cached data")
return(inv)
}
    mat <- x$get()
    inv <- solve(mat,...)
    x$setInverse(inv)
    inv 
}        ## Return a matrix that is the inverse of 'x'

