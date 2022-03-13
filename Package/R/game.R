#' @title Sudoku a difficulte controlee
#'
#'
#' @description A partir d'une difficulte, retourne un sudoku correspondant avec sa solution.
#' Pour pouvoir retourner le bon sudoku, on associe a chaque difficulte un ensemble de valeur
#' possible pour le nombre de backtracking, ainsi que le nombre de case a effacer.
#'
#' - Pour "Facile" : il y a entre 0 et 100 backtraking avec 40 cases vides.
#'
#' - Pour "Moyen" : il y a entre 100 et 1000 backtraking avec 45 cases vides.
#'
#' - Pour "Difficile" : il y a entre 1000 et 10000 backtraking avec 50 cases vides.
#'
#' - Pour "Cauchemar" : il y a entre 10000 et 100000 backtraking avec 55 cases vides.
#'
#'
#' @param diff Une chaine de caractere appartenant a "Facile", "Moyen", "Difficile", "Cauchemar"
#' @return Une liste contenant : un sudoku de difficulte diff, sa solution, et le nombre de backtracking necessaire a l'algorithme pour le resoudre.
#' @export
#' @examples
#' game("Difficile")



game <- function(diff) {
  # détermination du nombre de backtracking en fonction de la difficulté

  if (diff == "Facile") {
    min <- 0
    max <- 100
    N <- 2
  }

  if (diff == "Moyen") {
    min <- 100
    max <- 1000
    N <- 45
  }

  if (diff == "Difficile") {
    min <- 1000
    max <- 10000
    N <- 50
  }

  if (diff == "Cauchemar") {
    min <- 10000
    max <- 10000000
    N <- 55
  }

  A <- play_sudo(get_sudo(), N)
  B <- A
  res <- solve_sudo(B)

  while (res$nbr_ofback < min || res$nbr_ofback > max) {
    A <- play_sudo(get_sudo(), N)
    B <- A
    res <- solve_sudo(B)
  }
  fin <-
    list(
      sudoku = A,
      solution = res$sudoku,
      back = res$nbr_ofback
    )
  return(fin)
}
