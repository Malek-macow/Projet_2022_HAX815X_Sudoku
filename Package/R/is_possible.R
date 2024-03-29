#' @title Verification globale
#'
#' @description Cette fonction verifie si l'emplacement du chiffre dans un
#' sudoku est possible. Cette dernière utilise les differentes fonctions de
#' verification du package.
#'
#' @seealso Du package MALEX : in_line, in_col, in_bloc.
#
#' @param A Matrice  9x9
#' @param nrow numero de la ligne
#' @param ncol numero de la colonne
#' @param num un chiffre de 1 a 9
#' @return TRUE si l'emplacement est possible et FALSE sinon
#' @export
#' @examples
#' is_possible(play_sudo(sudo_ele(),50),1,1,4)
is_possible = function(A, nrow, ncol, num) {
  if (isFALSE(in_col(A, ncol, num)) &&
      isFALSE(in_line(A, nrow, num)) &&
      isFALSE(in_bloc(A, nrow, ncol, num))) {
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}
