#' Algorithme qui masque certaines valeurs du sudoku pour commencer à jouer.
#'
#' @param A, Matrice 9x9
#' @return Une matrice 9x9 de sudoku prête à jouer.
#'
#'
#' 


play_sudo <- function(A){
  for (i in (1:63)){
    a <- sample((1:9),2,replace = T)
    A[a[1],a[2]] = NA
  }
  return(A)
  }

