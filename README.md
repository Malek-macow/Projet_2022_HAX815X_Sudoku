# Projet Sudoku

[![PyPI license](https://img.shields.io/pypi/l/ansicolortags.svg)](https://pypi.python.org/pypi/ansicolortags/)
[![GitHub contributors](https://badgen.net/github/contributors/Naereen/Strapdown.js)](https://github.com/Eldohrim/Project_2021_HAX712X/graphs/contributors)

Ce dépôt git regroupe un package et une application `shiny` pour le développement d'un jeu de sudoku fait dans le cadre d'un projet du module HAX815X. Les programmes on été développés par BOUARROUDJ Abdelmalek et CAPEL Alexandre.

## Installations préalables

Avant de lancer l'application, il peut être nécessaire d'installer quelques librairies `R` qui ne sont pas présents par défaut de R-studio. Pour cela, tapez les commandes suivantes sur le terminal `R` : 

```R
# pour le thème de l'application
install.packages("shinythemes")

# ajout d'éléments intéractifs à l'application
install.packages("shinyWidgets")
```

Ces modules seront utiles pour lancer l'application.

## Quelques explications sur les options de jeux

### Lancement de l'application

Pour pouvoir commencer à jouer avec l'application, il suffit d'ouvrir le fichier `server.R` ou `ui.R` situés dans le dossier `Sudoku4` et de cliquer sur le bouton "Run app" situé en haut du fichier : 

<p align="center">
  <img src="https://github.com/Malek-macow/Projet_2022_HAX815X_Sudoku/blob/main/images/run_app.jpg" width="10000" title="Lancer l'application">
</p>

Normalement une fenêtre s'ouvre à ce moment-là. Vous pouvez également ouvrir l'application dans votre navigateur en appuyant sur "Open in Browser".

### Nouveau sudoku et sélection de difficulté

Normalement un page comme celle-ci a du s'ouvrir : 


<p align="center">
  <img src="https://github.com/Malek-macow/Projet_2022_HAX815X_Sudoku/blob/main/images/sudoku.jpg" width="800" title="Sudoku vide">
</p>  


On remarque que la grille de sudoku est vide ici. Pour pouvoir en construire un incomplet, il vous suffit de cliquer sur le bouton "Générer nouveau Sudoku" pour pouvoir commencer à jouer. 

Seulement, il se pourrait que vous voudriez corser un peu plus la difficulté du sudoku. Pas de problème ! Il vous suffit de sélectionner la difficulté en déplaçant le curseur bleu et blanc situé tout en dessous. La difficulté a été calculée en fonction du nombre de backtracking effectué par notre algorithme de résolution (pour plus d'information sur le backtracking, vous pouvez consulter [ce site](http://igm.univ-mlv.fr/~dr/XPOSE2013/sudoku/backtracking.html) qui explique tout très bien). Ainsi : 

- pour "Facile" : il y a entre 0 et 10 backtraking
- pour "Moyen" : il y a entre 10 et 100 backtraking
- pour "Difficile" : il y a entre 100 et 1000 backtraking
- pour "Cauchemar" : il y a entre 1000 et 10000 backtraking

Pour pouvoir ensuite jouer, il vous suffit d'appuyer une nouvelle fois sur "Générer un Sudoku" et vous aurez un sudoku à la difficulté correspondante.


### Remplir la grille et solution

Attendre le dernier ajout.


Enfin, si vous en avez marre et que vous souhaitez avoir directement la solution (oh malheur...), il vous suffit d'appuyer sur le bouton "Afficher la solution". Cette-dernière est celle obtenue par notre algorithme de résolution.



