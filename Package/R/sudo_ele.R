#' Produit un sudoku elementaire de maniere aleatoire
#'
#' @return Une matrice 9x9 correspondant a un sudoku elementaire
#' @export

sudo_ele <- function() {
  A <- matrix(NA, 9, 9)   # création de la matrice
  A[1, ] <-
    sample((1:9)) # on commence à générer une ligne aléatoire

  # les trois blocs du haut
  for (i in c(2, 3)) {
    A[i, ] <- c(A[i - 1, 4:9], A[i - 1, 1:3])
  }

  seq <- c(2, 3, 1, 5, 6, 4, 8, 9, 7)
  for (i in c(3, 6)) {
    A[i + (1:3), ] <- A[(i - 3) + (1:3), seq]
  }

  return(A)
}
