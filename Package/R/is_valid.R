#' Cette fonction verifie si un sudoku est valide ou non
#' (pas de nombre qui se repete dans une ligne, colonne ou bloc 3x3)
#'
#' @param A Sudoku (Matrice  9x9)
#' @param nrow Numero de la ligne
#' @param ncol Numero de la colonne
#' @param num Un chiffre de 1 a 9
#'
#' @return TRUE si le sudoku est valide, FALSE sinon.
is_valid <- function(A, nrow, ncol, num) {
  A[nrow, ncol] <- NA
  if (isFALSE(in_col(A, ncol, num)) &&
      isFALSE(in_line(A, nrow, num)) &&
      isFALSE(in_bloc(A, nrow, ncol, num))) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}
