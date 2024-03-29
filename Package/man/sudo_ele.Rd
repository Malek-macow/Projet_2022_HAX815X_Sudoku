% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sudo_ele.R
\name{sudo_ele}
\alias{sudo_ele}
\title{Construction d'un sudoku basique}
\usage{
sudo_ele()
}
\value{
Une matrice 9x9 correspondant a un sudoku elementaire.
}
\description{
Cette fonction produit un sudoku elementaire de maniere aleatoire.
Un sudoku elementaire se construit comme ceci : on répartit aléatoirement
les chiffres de 1 a 9 sur la premiere ligne, puis on remplit la seconde ligne
en faisant un decalage circulaire de la ligne du dessus par blocs de 3. On fait
de meme pour la troisieme ligne. Pour remplir ensuite les autres blocs, on
utilise le meme principe, mais en permutant les colonnes. On remarque qu'ainsi
construit, il n'y a que 9! sudoku possibles...
}
\seealso{
Dans le package MALEX, la fonction get_sudo permet de construire de
nouveaux sudoku, mais en decuplant le nombre possible.
}
