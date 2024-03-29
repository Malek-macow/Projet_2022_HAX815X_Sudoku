#' @title Resolution du sudoku
#'
#' @description Cette fonction resoud un sudoku donne par la methode du
#' backtracking. Cette-derniere consiste a remplir le sudoku au fur et a mesure
#' de la maniere suivante : si il y a plusieurs possibilites a une case, on en
#' choisit une puis on continue a remplir. Des qu'il y a une contradiction, on
#' retourne en arriere jusqu'a la derniere fois ou on a du faire un choix. Le
#' de backtracking nous permet notamment de construire une echelle de difficulte.
#'
#' @seealso Dans le package MALEX, la fonction game, pour voir l'utilisation du
#' nombre de backtracking.
#'
#' @param sudoku Matrice 9x9 (avec des valeurs manquantes NA et non pas des zeros)
#'
#' @return Liste qui contient le sudoku resolu et le nombre de retour que
#' l'algorithme a fait pour le resoudre.
#'
#' @export
#'
#' @examples
#' A <- play_sudo(sudo_ele(), 45)
#' solve_sudo(A)
#'


solve_sudo <- function(sudoku) {

  solve_case <- function(nrow, ncol) {
    valactu <-m$A[nrow, ncol] #On enregistre le chiffre de la case en premier

    if (valactu == 9) {
      #si le chiffre déjà dans la case est 9 on le remet à zero
      m$A[nrow, ncol] <<- 0
      return(FALSE)
    }

    for (k in (valactu + 1):9) {
      isSolved <-
        is_possible(m$A, nrow, ncol, k) #si k est possible dans cette case ça renvoit TRUE
      if (isSolved) {
        m$A[nrow, ncol] <<-
          k #si isSolved = True alors on remplis la case par k
        return(TRUE)
      }
    }

    m$A[nrow, ncol] <<-
      0 # si aucunes des autres conditions est vérifié alors on remplis la case en question par 0
    return(FALSE)

  }

  m <- new.env()
  m$df <-
    get_possibility(sudoku)$Dataframe #base de donnée qui contient les coordonnées des cases vides
  m$A <-
    transfo(sudoku) #transformer les NA en 0 pour pouvoir utiliser la fonction solve_case
  m$c <- 1
  m$nbr_ofback <- 0 #initier le nombre de retour en 0

  while (m$c <= nrow(m$df)) {
    #tant qu'il reste des cellules à résoudre appeler la fonction solve_case
    m$nrow <- m$df$i[m$c]
    m$ncol <- m$df$j[m$c]
    m$success <- solve_case(m$nrow, m$ncol)
    if (m$success) {
      m$c <- m$c + 1  #passer à la prochaine case vide
    } else {
      m$c <- m$c - 1  #revenir à la case d'avant et changer sa valeur
      m$nbr_ofback <-
        m$nbr_ofback + 1  #rajouter +1 au nombre de retour
    }
  }
  Liste <- list(sudoku = m$A, nbr_ofback = m$nbr_ofback)
  return(Liste)
}
