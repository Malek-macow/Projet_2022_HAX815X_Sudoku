#' Cette fonction elle vérifie si un sudoku est valide ou pas
#' (pas de nombre qui se répéte dans une méme ligne, colonne ou bloc 3x3)
#'
#' @param A Matrice  9x9
#'
#' @return TRUE si le sudoku est valide, FALSE sinon.
#'
#'


is_valid = function(A, nrow, ncol, num){
  A[nrow, ncol] = NA
  if (isFALSE(in_col(A, ncol, num)) &&
      isFALSE(in_line(A, nrow, num)) &&
      isFALSE(in_bloc(A, nrow, ncol, num))){
    return(TRUE)
  }
  else {return(FALSE)}
}
