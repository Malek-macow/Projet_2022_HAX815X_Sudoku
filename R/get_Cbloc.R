#' Renvoie le bloc colonne au quel le chiffre appartient
#'
#' @param ncol numéro de la colonne ou se trouve le chiffre
#'
#' @return le bloc colonne au quel le chiffre appartient
#'




get_Cbloc = function(ncol){
  if (ncol %in% (1:3)) {
    x=(1:3)
  } else if (ncol %in% (4:6)) {
    x=(4:6)
  } else if (ncol %in% (7:9)) {
    x=(7:9)
  } else {
    x="Erreur d'indéxation"
  }
  return(x)
}
