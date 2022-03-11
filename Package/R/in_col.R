#' @title Verification par colonne
#'
#' @description Cette fonction verifie si un chiffre existe deja dans une colonne
#' du sudoku.
#'
#' @param A, Matrice
#' @param ncol, numero de la colonne
#' @param num, un chiffre de 1 a 9
#' @return True si le chiffre existe deja dans la colonne et False sinon.
#' @export
#' @examples
#' in_col(sudo_ele(),1,8)


in_col = function(A, ncol, num) {
  num %in% A[, ncol]
}
