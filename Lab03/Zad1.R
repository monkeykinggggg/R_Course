makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

## moja czesc
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(m) {
    x <<- m
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse_sol) inv <<- inverse_sol
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

cacheSolve <- function(x, ...) {
  ## Twoj kod...
  ## Zwraca macierz odwrotna do 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv
}

## Testing code:
M = matrix(c(2.,2.,1.,3.), 2,2)
results = makeCacheMatrix(M)
cacheSolve(results)