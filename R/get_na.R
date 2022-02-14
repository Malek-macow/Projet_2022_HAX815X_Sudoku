#' Renvoie toutes les lignes et les colonnes qui contiennent des NA dans une matrice 9x9
#'
#' @param A Matrice  9x9
#'
#' @return Base de donnée de deux colonnes i et j qui contiennent les numéros des lignes respectivement des colonnes 
#'
#'



get_na = function(A){
  df <- data.frame(i=NULL,j=NULL)
  for (i in 1:9){
    for (j in 1:9){
      if (is.na(A[i,j])) {
        a <- data.frame(i,j)
        df <- rbind(df, a)
      }
    }
  }
  return(df)
}


