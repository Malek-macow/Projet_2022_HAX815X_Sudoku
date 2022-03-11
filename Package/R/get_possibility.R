#' @title Calcul des possibilites
#'
#' @description Calcule le nombre de possibilite pour chaque case d'un sudoku dont
#' certaines ont ete cachees.
#'
#' @param A matrice 9x9
#'
#' @return Liste qui contient une matrice 9x9 (avec les cases remplis par le
#'  nombre de possiblites) et une Dataframe qui contient la ligne et la colonne
#'  des cases vides avec leurs nombre de possibilite.
#'
#' @export
#'
#' @examples
#' A <- play_sudo(sudo_ele(), 45)  # pour avoir un sudoku vide
#' get_possibility(A)



get_possibility <- function(A) {
  P <- matrix(0, 9, 9)
  for (i in 1:9) {
    for (j in 1:9) {
      if (is.na(A[i, j])) {
        X <- 0
        for (k in 1:9) {
          if (is_possible(A, i, j, k)) {
            X <- X + 1
          }
          P[i, j] <- X
        }
      }
    }
  }
  df <- data.frame(i = NULL, j = NULL)
  for (i in 1:9) {
    for (j in 1:9) {
      for (k in 1:9) {
        if (P[i, j] == k) {
          a <- data.frame(i, j, k)
          df <- rbind(df, a)
        }
      }
    }
  }
  df <- df[order(df[, 3], decreasing = F), ]

  Liste <- list(Matrice = P, Dataframe = df)
  return(Liste)
}
