#' Cette fonction résolue une case d'un sudoku
#'
#' @param A Matrice  9x9
#' @param nrow numéro de la ligne
#' @param ncol numéro de la colonne
#' @return True si la case est résolue False sinon.
#'
#'
#'



solve_case = function(A, nrow, ncol) {

  valactu = A[nrow, ncol] #On enregistre le chiffre de la case en premier

  if (valactu == 9) { #si le chiffre déjà dans la case est 9 on le remet à zero
    A[nrow, ncol]<<- 0
    return(FALSE)}

  for(k in (valactu+1):9) {
    isSolved = is_possible(A, nrow, ncol, k) #si k est possible dans cette case ça renvoit TRUE
    if(isSolved) {
      A[nrow, ncol] <<- k #si isSolved = True alors on remplis la case par k
      return(TRUE)}
  }

  A[nrow, ncol] <<- 0 # si aucunes des autres conditions est vérifié alors on remplis la case en question par 0
  return(FALSE)
}
