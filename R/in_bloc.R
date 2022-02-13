#' Vérifie si un chiffre existe déjà dans un bloc 3x3 donnée
#'
#' @param A Matrice
#' @param nrow Numéro de la ligne
#' @param ncol Numéro de la colonne
#' @param num Un chiffre de 1 à 9
#'
#' @return True si le chiffre existe déjà dans le bloc 3x3 et False sinon.
#'


in_bloc = function(A, nrow, ncol, num){
  num %in% A[get_Lbloc(nrow), get_Cbloc(ncol)]
}

