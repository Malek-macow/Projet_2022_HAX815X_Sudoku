#' @title Transformation de matrice
#'
#' @description Cette fonction transforme une matrice 9x9 avec des NA en matrice
#'  9x9 avec des zeros a la place.
#'
#' @param A Matrice  9x9
#'
#' @return Matrice 9x9 avec des zeros au lieu des NA.
#'
#' @export
#'
#' @examples
#' A <- play_sudo(sudo_ele(), 45)
#' print(transfo(A))


transfo <- function(A) {
  for (i in 1:9) {
    for (j in 1:9) {
      if (is.na(A[i, j])) {
        A[i, j] <- 0
      }
    }
  }
  return(A)
}
