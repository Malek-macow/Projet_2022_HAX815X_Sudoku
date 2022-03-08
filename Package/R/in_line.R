#' Vérifie si un chiffre existe déjà dans une ligne donnée
#'
#' @param A Matrice  9x9
#' @param nrow numéro de la ligne
#' @param num un chiffre de 1 à 9
#'
#' @return True si le chiffre existe déjà dans la ligne et False sinon.
#'

in_line = function(A, nrow, num){
  num %in% A[nrow, ]
}



