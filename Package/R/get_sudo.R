#' Genere un sudoku aleatoire a partir d'un sudoku elementaire.
#'
#' @return Une matrice 9x9 correspondant a un sudoku elementaire
#' @export
get_sudo <- function() {
  A <- sudo_ele()
  for (i in (1:500)) {
    bloc <- sample(c(0, 3, 6), 1)
    a <- sample((1:3), 2)
    if (i %% 2 == 0) {
      b <- A[bloc + a[1],]
      A[bloc + a[1],] <- A[bloc + a[2],]
      A[bloc + a[2],] <- b
    } else{
      b <- A[, bloc + a[1]]
      A[, bloc + a[1]] <- A[, bloc + a[2]]
      A[, bloc + a[2]] <- b
    }
  }
  return(A)
}
