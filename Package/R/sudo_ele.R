#' @title Construction d'un sudoku basique
#'
#' @description Cette fonction produit un sudoku elementaire de maniere aleatoire.
#' Un sudoku elementaire se construit comme ceci : on répartit aléatoirement
#' les chiffres de 1 a 9 sur la premiere ligne, puis on remplit la seconde ligne
#' en faisant un decalage circulaire de la ligne du dessus par blocs de 3. On fait
#' de meme pour la troisieme ligne. Pour remplir ensuite les autres blocs, on
#' utilise le meme principe, mais en permutant les colonnes. On remarque qu'ainsi
#' construit, il n'y a que 9! sudoku possibles...
#'
#' @seealso Dans le package MALEX, la fonction get_sudo permet de construire de
#' nouveaux sudoku, mais en decuplant le nombre possible.
#'
#' @return Une matrice 9x9 correspondant a un sudoku elementaire.
#'
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
