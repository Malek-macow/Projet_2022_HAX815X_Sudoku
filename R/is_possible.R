#' Verifie si l'emplacement du chiffre dans un sudoku est possible
#
#' @param A Matrice  9x9
#' @param nrow numero de la ligne
#' @param ncol numero de la colonne
#' @param num un chiffre de 1 ? 9
#'
#' @return TRUE si l'emplacement est possible et FALSE sinon
#'



is_possible = function(A, nrow, ncol, num){
  if (isFALSE(in_col(A, ncol, num)) &&
      isFALSE(in_line(A, nrow, num)) &&
      isFALSE(in_bloc(A, nrow, ncol, num))){
    return(TRUE)
  }
  else {return(FALSE)}
}
