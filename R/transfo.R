#' Transforme une matrice 9x9 avec des NA en matrice 9x9 avec des zeros à la place.
#'
#' @param A Matrice  9x9
#'
#' @return Matrice 9x9 avec des zeros au lieu des NA 
#'


transfo = function(A){
  for (i in 1:9){
    for (j in 1:9){
      if (is.na(A[i, j])){A[i, j] = 0}
    }
  }
  return(A)
}
