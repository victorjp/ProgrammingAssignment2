## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  

## can get the inverse matrix and cache's it
## create a square matrix
  
## creates the inverse variable argument  
inverse <- NULL

CreateMatrix <- function(v) {
    x <<-v # passes the matrix initially pased to the makeCahce and creates a pointer
           # in the cache 
    inverse <<-NULL  #same for the inverse pointer
  }
PrintMatrix <- function() x

CalcInverse <- function() {
    ## If (det(x)==0) message("Matrix non invertible")
    inverse <<- solve(x)  #gets t
  
  }
PrintInverse <- function() inverse

#output of the CreateMatrix function
list(CreateMatrix = CreateMatrix, PrintMatrix = PrintMatrix,
     CalcInverse = CalcInverse,
     PrintInverse = PrintInverse)  


  
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  

## will get the inverse of the Matrix created above, but first it will validat
## is the matrix is the same and the inverse already exist, it would returned
# the cache one, otherwise it will do the math
  
 # if (identical(y,x)==FALSE) {
    
#  mesage("Matrix changed, impossible to retrieve from cache")  
    
 # }  This condition is for the matriz change or not
  
  if (!is.null(x$PrintInverse())) {
    message("getting cached matrix")
    x$PrintInverse()
    
    
  }
  else  {
    x$CalcInverse()
    x$PrintInverse()
  }
  
    
    

  
  ## Return a matrix that is the inverse of 'x'
}
