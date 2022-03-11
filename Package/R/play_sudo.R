#' @title Suppression des cases
#'
#' @description Algorithme qui masque certaines valeurs du sudoku pour commencer
#' a jouer. Les cases sont masquees de maniere aleatoire, jusqu'a atteindre un certain
#' nombre de case vide.
#'
#' @param A Matrice 9x9
#' @param N  Nombre de valeurs manquantes dans le sudoku
#'
#' @return Une matrice 9x9 de sudoku pret a jouer.
#'
#' @export
#'
#' @examples
#' A <- get_sudo()
#' play_sudo(A, 45)
#'


play_sudo <- function(A, N) {
  repeat {
    A[sample(1:9, replace = TRUE, 1), sample(1:9, replace = TRUE, 1)] <- NA
    if (length(which(is.na(A), arr.ind = F)) >= N) {
      break
    }
  }
  return(A)
}
