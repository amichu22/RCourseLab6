#' Dynamic programming in R
#'
#' #' Knapsack problem solution using dynamic programming in R.
#'
#' @param x Data.frame containing values and weights.
#' @param W Highest capacity
#'
#' @return Returns maximum knapsack value and respective elements
#' @export
#'
#' @examples knapsack_dynamic(x=knapsack_objects[1:1200,], W = 2000)
#' 
#' @references \href{https://en.wikipedia.org/wiki/Knapsack_problem}{Dynamic Algorithm}
#' 
knapsack_dynamic<-function(x,W){
  
  #whether the inputs are non-negative interger values.
  
  if(is.data.frame(x) && is.numeric(W)) {
    if(x[[1]]>0 && x[[2]]>0 && W>0){
      n<-nrow(x)
      weights<-x[[1]]
      values<-x[[2]]
      Capacity<-W
      item<-c()
      m<-matrix(rep(0),nrow=n+1,ncol=Capacity+1)
      
      for(i in 2:n){
        for(j in 1:Capacity){
         
          if(weights[i]>j)
          {
            m[i,j]<- m [i-1,j]
            
          }
          else{
            m[i,j]<-max(m[i-1,j],m[i-1,j-weights[i]]+values[i])
            
          }
        }
  
      }
      knapsack<-round(m[n,Capacity])
      
      
      
      while(Capacity>0 && n-1>0)
      {
        if(m[n,Capacity]!= m[n-1,Capacity]){
          item<-append(item,n)
          Capacity<-Capacity-weights[n]
        }
        n<-n-1
        
      }
      return(list(value=knapsack,elements=sort(item)))
      
      
    }
    else stop("Data is not positive ! \n",call. = FALSE)
  }
  else
    stop("Data is not numeric or not dataframe ! \n",call. = FALSE)
}
# set.seed(42)
# n=2000
# knapsack_objects <-
#   data.frame(
#     w=sample(1:4000, size = n, replace = TRUE),
#     v=runif(n = n, 0, 10000)
#   )
# 
# knapsack_dynamic_n500<-system.time(knapsack_dynamic(x=knapsack_objects[1:800,], W = 3500))
# 
# knapsack_dynamic(x=knapsack_objects[1:8,], W = 2000)