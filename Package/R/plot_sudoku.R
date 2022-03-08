#' Affiche un sudoku.
#'
#' @param A, Matrice 9x9
#' @return Affichage graphique du sudoku
#' @importFrom graphics lines text
#' @export
plot_sudoku <- function(A) {
  plot(
    1,
    type = 'n',
    xlab = "",
    ylab = "",
    xlim = c(0, 10),
    ylim = c(0, 10),
    axes = FALSE
  )

  for (i in seq(.5, 9.5, 3)) {
    lines(c(.5, 9.5), c(i, i), lwd = 3, col = "dodgerblue4")
    lines(c(i, i), c(.5, 9.5), lwd = 3, col = "dodgerblue4")
  }

  for (i in seq(.5, 9.5, 1)) {
    lines(c(.5, 9.5), c(i, i), lwd = 1, col = "dodgerblue4")
    lines(c(i, i), c(.5, 9.5), lwd = 1, col = "dodgerblue4")
  }
  for (i in 1:9) {
    text(i, 10, i)
    text(0, i , (10 - i))
    text(10, i, (10 - i))
    text((10 - i), 0, (10 - i))
  }

  for (i in 1:9) {
    for (j in 1:9) {
      text((10 - j), (10 - i), A[i, (10 - j)], cex = 2.5 , col = "darkorange3")
    }
  }
  return(A)
}
