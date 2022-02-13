#' Renvoie le bloc ligne au quel le chiffre appartient
#'
#' @param nrow numéro de la ligne ou se trouve le chiffre
#'
#' @return le bloc ligne au quel le chiffre appartient
#'



get_Lbloc = function(nrow){
  if (nrow %in% (1:3)) {
    x=(1:3)
  } else if (nrow %in% (4:6)) {
    x=(4:6)
  } else if (nrow %in% (7:9)) {
    x=(7:9)
  } else {
    x="Erreur d'indéxation"
  }
  return(x)
}




