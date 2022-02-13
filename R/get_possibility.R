#' Calcule le nombre de possibilité pour chaque case du sudoku (matrice 9x9)
#'
#' @param A Matrice  9x9
#'
#' @return Matrice 9x9 qui contient dans chaque case le nombre de chiffre possible à mettre dans cette case.
#'
#'

get_possibility = function(A){
  P=matrix(0, 9, 9)
  for (i in (1:length(df$i))){
    X=0
    for (k in (1:9)){
      if (is_possible(A, df$i[i] , df$j[i], k) == TRUE){X=X+1}
      P[df$i[i] , df$j[i]]=X
    }
  }
  return(P)
}

