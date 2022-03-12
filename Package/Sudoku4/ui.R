library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinyalert)
devtools::load_all()

shinyUI(fluidPage(
  theme = shinytheme("superhero"),

  titlePanel(
    h1(
      strong(
        em(
          HTML("<u style='color: darkorange'><p style='color: darkorange;
                   text-align: center;
                   font-family: Monaco;'>Sudoku MALEX</p></u>")
          )
        ),
      ),

    windowTitle = "Jeu de Sudoku"
    ),

  p(HTML("Développé par "),
    em(HTML("BOUARROUDJ Abdelmalek")),
    HTML("et"),
    em(HTML("CAPEL Alexandre."))
    ),
  hr(),
  sidebarLayout(
    sidebarPanel(
      p(strong(HTML("<u>Règles du jeu : \n</u>"))),
      p(
        HTML(
          text = "<p style='font-family: emoji;'>Remplir les cases vides
                  avec les chiffres de 1 à 9, de telle sorte qu'ils n'apparaissent
                  qu'une fois par ligne, par colonne et par carré de 3x3 cases.
                  Bon courage ԅ(≖‿≖ԅ)</p>"
        )
      ),
      hr(),
      fixedRow(column(2,
                      p(HTML(
                        "   "
                      ))),
               column(
                 10,
                 actionBttn(
                   "Nouveau",
                   label = "Générer nouveau Sudoku",
                   style = "stretch",
                   color = "warning"
                 )
               )),
      hr(),
      p(strong(HTML(" Remplir le Sudoku :"))),
      fluidRow(
        verbatimTextOutput("info"),

        column(
          autonumericInput(
            inputId = "valeur",
            label = "Valeur",
            value = 1,
            minimumValue = 1,
            maximumValue = 9,
            decimalPlaces = 0,
            width = 50
          ),
          width = 3
        ),
        column(
          actionBttn(
            inputId = "mAj",
            label = "Valider",
            style = 'gradient',
            color = "warning",
            size = "md"
          ),
          width = 12
        ),
        column(
          actionBttn(
            inputId = "sup",
            label = "Supprimer",
            style = 'gradient',
            color = "warning",
            size = "md"
          ),
          width = 5
        )
      ),
      h3(strong(HTML("Options de jeu"))),
      br(),
      fixedRow(sliderTextInput(
        inputId = "difficulte",
        label = h5(HTML("Sélectionner la difficulté :")),
        choices = c("Facile", "Moyen", "Difficile", "Cauchemar")
      )),
      br(),
      fixedRow(useShinyalert(),
               column(2,
                      p(HTML(
                        "  "
                      ))),
               column(
                 6,
                 actionBttn(
                   "Solution",
                   label = "Afficher la solution",
                   style = "gradient",
                   color = 'warning'
                   ),
                   tags$style("#Solution{font-size: 18px;
                                  font-family: 'emoji';
                                  text-align: center;
                              }")
                 )
               ),
    ),
    mainPanel(
      textOutput('text1'),
      tags$strong(tags$style("#text1{color: orange;
                                 font-size: 20px;
                                 font-style: normal;
                                 text-align: center;
                                 font-family: 'Lucida Bright';
                                 }"
                           )
                ),
      br(),

      modalDialog(
        "- Pour pouvoir commencer à jouer, il vous suffit de choisir en bas le niveau
            de difficulté puis de cliquer sur le bouton Générer nouveau Sudoku.",
        br(),
        "- Pour remplir ou supprimer une case il faut d'abord cliquer sur
        la case que vous voulez remplir puis vérifier à gauche si c'est la bonne
        ligne et colonne que vous avez séléctionné.",
        br(),
        "Bonne partie.",
        title = "À lire attentivement !",
        footer = modalButton("OK"),
        size = "l",
        easyClose = FALSE,
        fade = TRUE,
      ),

      fluidRow(
        column(
          12,
          plotOutput("plot1", click = "plot_click"),
          plotOutput("sudoku"),
          tags$style("#plot1{
                     text-align:center;
                     }"
                     )
          ),
        ),
      p(
        HTML("Application développée avec R Shiny, code disponible sur notre "),
        a(href = "https://github.com/Malek-macow/Projet_2022_HAX815X_Sudoku", "git"),
        HTML('.')
      ),
    )
  )
))
