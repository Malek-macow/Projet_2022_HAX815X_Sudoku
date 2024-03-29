% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_valid.R
\name{is_valid}
\alias{is_valid}
\title{Validation d'un sudoku}
\usage{
is_valid(A, nrow, ncol, num)
}
\arguments{
\item{A}{Sudoku (Matrice  9x9)}

\item{nrow}{Numero de la ligne}

\item{ncol}{Numero de la colonne}

\item{num}{Un chiffre de 1 a 9}
}
\value{
TRUE si le sudoku est valide, FALSE sinon.
}
\description{
Cette fonction verifie si un sudoku est valide ou non
(pas de nombre qui se repete dans une ligne, colonne ou bloc 3x3).
}
\examples{
is_valid(sudo_ele(), 8, 2, 3)
}
\seealso{
Du package MALEX : in_line, in_col, in_bloc.
}
