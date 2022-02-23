library(shiny)
library(shinythemes)
library(shinyWidgets)
devtools::load_all()

shinyUI(fluidPage(theme = shinytheme("superhero"),
    titlePanel(h1(strong(em(HTML("Sudoku4"))),), windowTitle = "Jeu de Sudoku"),

    p(HTML("Développé par "), em(HTML("BOUARROUDJ Abdelmalek")),
      HTML("et"), em(HTML("CAPEL Alexandre."))),
    hr(),
    sidebarLayout(
        sidebarPanel(
            p(strong(HTML("Règles du jeu : \n "))),
            p(HTML(text = "Remplir les cases vides avec les chiffres de 1 à 9,
                   de telle sorte qu'ils n'apparaissent qu'une fois par ligne,
                   par colonne et par carré de 3x3 cases. Bon courage :)")),
            br(),
            fixedRow(
                column(2,
                       p(HTML("   "))
                       ),
                column(10,
                       actionBttn("Nouveau", label = "Générer nouveau Sudoku",
                                  style ="stretch",color = "warning")
                       )
                ),
            hr(),
            h3(strong(HTML("Options de jeu"))),
            br(),
            fixedRow(
                sliderTextInput(inputId = "difficulte", label = h5(HTML("Sélectionner la difficulté :")),
                            choices=c("Facile", "Moyen", "Difficile", "Cauchemar")
                            )
            ),
            br(),
            fixedRow(
                column(2,
                       p(HTML("  "))
                       ),
                column(10,
                    actionBttn("Solution", label = "Afficher la solution",
                               style = "gradient", color='warning')
                    )
                )
            ),

        mainPanel(
            verbatimTextOutput("passudoku"),

            fluidRow(
              column(2,
                     p(HTML("  "))
                     ),
              column(10,
                     plotOutput("sudoku"))
              ),
            hr(),
            p(HTML("Application développée avec R Shiny, code disponible sur notre "),
              a(href="https://github.com/Malek-macow/Projet_2022_HAX815X_Sudoku",
                "git"),HTML('.'))
            )
        )
    ))
