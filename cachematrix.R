## Below are two functions that are used to create a special object that stores a 
# matrix and cache's its inverse.

## makeCacheMatrix function creates a special vector which is really a list containing
# fucntions to set the value of matrix, get the value of matrix, set the inverse of matrix, 
# get the inverse of the matrix. It initialises inverse "matinv" as nUll. 

makeCacheMatrix <- function(x = matrix()) {
  matinv<- NULL
  set<- function(y){
    x<<-y
    matinv<<- NULL
  }

  get<- function() x
  setinv<- function(inverse) matinv<<- inverse
  getinv<- function() matinv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Following function calculates the inverse of the matrix "matinverted" .However, it first checks
#to see if the inverse has already been calculated. If so it gets its value from cache and 
# skips the computation. Otherwise, it calculates the inverse of the data and sets its value 
# in the cache via setinv function. 

cacheSolve <- function(x, ...) {
  matinverted<- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(matinverted)
  }
  data<- x$get()
  matinverted<- solve(data,...)
  x$setinv(matinverted)
  matinverted
        
}
