#' Résolue le sudoku par la méthode du backtracking
#'
#' @param sudoku Matrice  9x9 (avec des valeurs manquantes NA et non pas des zeros)
#' @return Liste qui contient le sudoku résolu et le nombre de retour que l'algorithme a fait pour le résoudre
#'
#'



solve_sudo = function(sudoku){

  df = get_possibility(sudoku)$Dataframe #base de donnée qui contient les coordonnées des cases vides

  A <<- transfo(sudoku) #transformer les NA en 0 pour pouvoir utiliser la fonction solve_case

  c = 1
  nbr_ofback = 0 #initier le nombre de retour en 0
  while (c <= nrow(df)){  #tant qu'il reste des cellules à résoudre appeler la fonction solve_case
    nrow = df$i[c]
    ncol = df$j[c]
    success = solve_case(A, nrow, ncol)
    if (success){
      c = c+1  #passer à la prochaine case vide
    } else {
      c = c-1  #revenir à la case d'avant et changer sa valeur
      nbr_ofback = nbr_ofback+1  #rajouter +1 au nombre de retour
    }
  }
  Liste = list(sudoku = A, nbr_ofback= nbr_ofback)
  return(Liste)
}
