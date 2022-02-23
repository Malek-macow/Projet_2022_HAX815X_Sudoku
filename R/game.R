#' A partir d'une difficulte, retourne un sudoku correspondant avec sa solution.
#'
#' @param diff, Une chaine de caractere appartenant a c("Facile", "Moyen", "Difficile", "Cauchemar")
#'
#' @return une liste contenant : un sudoku de difficulté diff, sa solution, et le nombre de backtracking nécessaire à l'algorithme pour le résoudre.
#'




game <- function(diff){
  # détermination du nombre de backtracking en fonction de la difficulté
  min <- 0
  max <- 1               # valeurs par défaut

  if (diff == "Facile"){
    min <- 0
    max <- 10
  }

  if (diff == "Moyen"){
    min <- 10
    max <- 100
  }

  if (diff == "Difficile"){
    min <- 100
    max <- 1000
  }

  if (diff == "Cauchemar"){
    min <- 1000
    max <- 10000
  }

  A <- play_sudo(get_sudo())
  B <- A
  res <- solve_sudo(B)

  while (res$nbr_ofback <min || res$nbr_ofback>max){
    A <- play_sudo(get_sudo())
    B <- A
    res <- solve_sudo(B)
  }
  fin <- list(sudoku = A, solution = res$sudoku, back = res$nbr_ofback)
  return(fin)
}

