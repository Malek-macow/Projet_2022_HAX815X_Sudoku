#' Verifie si un chiffre existe deja dans une ligne donnee
#'
#' @param A Matrice  9x9
#' @param nrow numero de la ligne
#' @param num un chiffre de 1 a 9
#' @return True si le chiffre existe deja dans la ligne et False sinon.
#' @export
#' @examples
#' in_line(sudo_ele(),1,6)
in_line = function(A, nrow, num) {
  num %in% A[nrow,]
}
