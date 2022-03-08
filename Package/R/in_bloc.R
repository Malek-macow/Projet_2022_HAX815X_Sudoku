#' Verifie si un chiffre existe deja dans un bloc 3x3
#'
#' @param A, Matrice 9X9 sous forme d'un sudoku
#' @param nrow Numero de la ligne
#' @param ncol Numero de la colonne
#' @param num Un chiffre de 1 a 9
#' @return Renvoie True si le chiffre existe deja dans le bloc 3x3 et False sinon.
#' @export
in_bloc = function(A, nrow, ncol, num) {
  num %in% A[(nrow - 1) %/% 3 * 3 + (1:3), (ncol - 1) %/% 3 * 3 + (1:3)]
}

