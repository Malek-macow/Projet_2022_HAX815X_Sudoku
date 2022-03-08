#' Calcule le nombre de possibilité pour chaque case du sudoku (matrice 9x9)
#'
#' @param A Matrice  9x9
#'
#' @return Liste qui contient une matrice 9x9 (avec les cases remplis par le nombre de possiblités) et une Dataframe
#'
#'

get_possibility = function(A){

  P = matrix(0,9,9)
  for (i in 1:9){
    for (j in 1:9){
      if (is.na(A[i, j])){
        X = 0
        for (k in 1:9){
          if (is_possible(A, i, j, k)){X = X+1}
          P[i, j] = X
        }
      }
    }
  }
  df = data.frame(i=NULL, j=NULL)
  for (i in 1:9){
    for (j in 1:9){
      for (k in 1:9){
        if (P[i, j] == k) {
          a = data.frame(i,j,k)
          df = rbind(df, a)
        }
      }
    }
  }
  df = df[order(df[, 3], decreasing=F), ]

  Liste = list(Matrice = P, Dataframe = df)
  return(Liste)
}