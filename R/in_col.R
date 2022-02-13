#' Vérifie si un chiffre existe déjà dans une colonne donnée
#'
#' @param Matrice
#' @param ncol numéro de la colonne
#' @param num un chiffre de 1 à 9
#'
#' @return True si le chiffre existe déjà dans la colonne et False sinon.
#'

in_col = function(A, ncol, num){
  num %in% A[, ncol]
}
