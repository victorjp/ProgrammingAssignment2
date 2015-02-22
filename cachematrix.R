# This function takes a matrix as an argument, and creates
# a "special" matrix element, that can cache its inverse
# by calling the CalcInverse function.
# It is assumed that the matrix is invertible (square and determinant <> 0)

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL
  initialstate <<-  TRUE #pointer to validate if the matrix has changed

  #caches the matrix to a pointer, by default is the original matriz
  #but it could cache a different matrix
  CacheMe <- function(v = x) {
    if (!identical(x,v)) initialstate <<- FALSE
    x <<-v            
    inverse <<-NULL
  }
  #returns the matrix
  PrintMe <- function() x
  
  #obtains the inverse of the matrix and stores it in cache
  InverseMe <- function() {
    inverse <<- solve(x)
  }
  #returns the inverse of the matrix already stored
  PrintMeInverse <- function() inverse

  #output of the primary function
  list(CacheMe = CacheMe, PrintMe = PrintMe,
       InverseMe = InverseMe,
       PrintMeInverse = PrintMeInverse)  
    
}


# This function receive a special matrix element as created by the function above
# and verifies if the inverse is already stored in the memory and the matrix
# is the same that was original passed when the special matrix elemented was created.
# If both conditions are met, then it returns the inverse of the matrix already stored
# in cache. Otherwise it will calculated the inverse and store it in cache.

cacheSolve <- function(x, ...) {
  
  #This if verifies that the inverse is cached and it is still the initial matrix  
  if (!is.null(x$PrintMeInverse()) && initialstate == TRUE) {
    message("getting cached matrix") 
    x$PrintMeInverse()  # returns the cached inverse
  }
  #If the conditions above are not met, then it calculated the inverse
  #and stores it in the cache.
  else  {
    initialstate <<- TRUE
    x$InverseMe()
    x$PrintMeInverse()  
  }
  
}
