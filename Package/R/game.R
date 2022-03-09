#' A partir d'une difficulte, retourne un sudoku correspondant avec sa solution.
#'
#' @param diff, Une chaine de caractere appartenant a "Facile", "Moyen", "Difficile", "Cauchemar"
#' @return une liste contenant : un sudoku de difficulte diff, sa solution, et le nombre de backtracking necessaire a l'algorithme pour le resoudre.
#' @export
#' @examples
#' game("Difficile")
game <- function(diff) {
  # détermination du nombre de backtracking en fonction de la difficulté

  if (diff == "Facile") {
    min <- 0
    max <- 100
    N <- 40
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
