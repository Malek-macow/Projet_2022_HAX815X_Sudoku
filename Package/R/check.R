#' @title Validation d'un sudoku
#'
#' @description Cette fonction verifie à la fin de la partie le sudoku est valide ou non
#' (pas de nombre qui se repete dans une ligne, colonne ou bloc 3x3).
#'
#' @seealso Du package MALEX : is_valid
#'
#' @param A Sudoku (Matrice  9x9)
#'
#' @return TRUE si le sudoku est valide, FALSE sinon.
#'
#' @export
#'
#' @examples
#' check(sudo_ele())
check = function(A){
  H=matrix(0,9,9)
  if (isFALSE(all(!is.na(A)))){return(FALSE)}
  for (i in 1:9){
    for (j in 1:9){
      K = A[i,j]
      if(is_valid(A,i,j,K)){
        H[i,j] <- TRUE
      }else {H[i,j] <- FALSE}
    }
  }
  if(all(H==1)){return(TRUE)
    }else return(FALSE)
}
