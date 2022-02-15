#' Génère un sudoku aléatoire à partir d'un sudoku élémentaire.
#'
#'
#'

get_sudo <- function(A){
  for (i in (1:100)){
    bloc <- sample(c(0,3,6),1)
    a <- sample((1:3),2)
    if (i%%2==0){
      b <- A[bloc+a[1],]
      A[bloc+a[1],] <- A[bloc+a[2],]
      A[bloc+a[2],] <- b
    }else{
      b <- A[,bloc+a[1]]
      A[,bloc+a[1]] <- A[,bloc+a[2]]
      A[,bloc+a[2]] <- b
      }
  }
  return(A)
}
