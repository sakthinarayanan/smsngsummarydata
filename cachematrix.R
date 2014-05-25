## R Prog to compute inverse of matrix with cache data
## Supply only Invertible Matix
## if Inverse of the matrix is already present , Inverse is populated from cache


## Function returns a list with Set to set matrix , Get to see contents of matirx
## SetInverse to set the inverse  , GetInverse to get the inverse 


makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

v
## Checks to see if the inverse is already computed by getting the value of m from makeCacheMatrix
## If cache value is not availabe, Inverse is computed here

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
    m <- solve(data, ...)
  x$setinverse(m)
  m
}

