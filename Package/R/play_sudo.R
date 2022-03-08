#' Algorithme qui masque certaines valeurs du sudoku pour commencer a jouer.
#'
#' @param A, Matrice 9x9
#' @param N,  Nombre de valeurs manquantes dans le sudoku
#' @return Une matrice 9x9 de sudoku prete a jouer.
#' @export
play_sudo <- function(A, N) {
  repeat {
    A[sample(1:9, replace = TRUE, 1), sample(1:9, replace = TRUE, 1)] <-
      NA
    if (length(which(is.na(A), arr.ind = F)) >= N) {
      break
    }
  }
  return(A)
}

