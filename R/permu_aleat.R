#' Permute aléatoirement une matrice 9x9 par bloc (3x9 et 9x3)
#'
#' @param Une matrice  9x9
#' @return Une matrice 9x9 permuter
#'





permu_aleat = function (A){

  for (i in c(0,3,6)){
  
  A[, (1:3)+i] = A[, (1:3)+i][, sample(ncol(A[ ,(1:3)+i]))]
  A[(1:3)+i, ] = A[(1:3)+i, ][sample(nrow(A[(1:3)+i, ])), ]
  }
  return(A)
}
