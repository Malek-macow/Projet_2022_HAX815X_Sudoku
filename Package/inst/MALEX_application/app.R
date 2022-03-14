library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinyalert)


# Define UI for application that draws a histogram
ui <- fluidPage(
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
        ),
        column(
          actionBttn(
            inputId = "check",
            label = "Verifier",
            style = 'gradient',
            color = "warning",
            size = "md"
          ),
          width = 12
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
)

server <- shinyServer(function(input, output) {
  v <- reactiveValues(
    affiche = "Pas de sudoku initialisé",
    sudo = matrix(NA, 9, 9),
    sol = matrix(NA, 9, 9),
    mess = "Bonne partie ;)",
    CHECK = " "
  )


  observeEvent(input$Nouveau, {
    tout <- game(input$difficulte)
    v$affiche <- paste("Sudoku ",
                       input$difficulte,
                       "(nombre de backtracking : ",
                       tout$back,
                       ")")
    v$sudo <- tout$sudoku
    v$sol <- tout$solution
    v$control <- tout$sudoku
  })

  observeEvent(input$Nouveau, {
    shinyalert(
      "Attention !",
      "Une fois le jeu lancé, si vous regardez la solution la partie s'arrêtera.",
      type = "info",
      showConfirmButton = T,
      confirmButtonText = "OK"
    )
  })
  observeEvent(input$check, {
    if (v$CHECK == "Félicitations vous avez réussi") {
      shinyalert(
        "Félicitaion !",
        "Vous avez réuissi à résoudre le Sudoku.",
        type = "success",
        showConfirmButton = T,
        confirmButtonText = "Une autre partie"
      )
    }
    if (v$CHECK == "Oupss, Encore un effort !") {
      shinyalert(
        "Oupsss !",
        "Encore un effort.",
        type = "error",
        showConfirmButton = T,
        confirmButtonText = "Continuer"
      )
    }
  })

  observeEvent(input$Solution, {
    v$affiche = "Voici la solution :"
  })


  observeEvent(input$mAj, {
    i = 9 - floor(input$plot_click$y - 0.5)
    j = floor(input$plot_click$x - 0.5) + 1
    if (!all(is.na(v$sudo))) {
      val <- input$valeur
      if (is.na(v$control[i, j])) {
        v$sudo[i, j] <<- val
      }

      if (!is_valid(v$sudo, i, j, v$sudo[i, j])) {
        v$mess <- "Oops, ce n'est pas juste "
      } else{
        v$mess <- "Bien joué ! Continuez "
      }
      if (!is.na(v$control[i, j])) {
        v$mess <- "Impossible de modifier cette case"
      }
    }

  })

  observeEvent(input$mAJ, {
    if (is.na(v$control[i, j])) {
      if (!is_valid(v$sudo, i, j, v$sudo[i, j])) {
        v$mess <- "Oops, ce n'est pas juste :'("
      } else{
        v$mess <- "Bien joué ! Continuez :)"
      }
      showNotification(v$mess)
    }
    else {
      v$mess <- "Impossible de remplir modifier cette case"
    }
    showNotification(v$mess)
  })

  observeEvent(input$sup, {
    i = 9 - floor(input$plot_click$y - 0.5)
    j = floor(input$plot_click$x - 0.5) + 1
    if (is.na(v$control[i, j])) {
      v$sudo[i, j]  <- NA
    }
  })

  observeEvent(input$check, {
    if (check(v$sudo)) {
      v$CHECK <- "Félicitations vous avez réussi"
    } else {
      v$CHECK <- "Oupss, Encore un effort !"
    }
  })

  output$text1 <- renderText({
    v$affiche
  })

  output$plot1 <- renderPlot({
    if (v$affiche == "Voici la solution :") {
      plot_sudoku(v$sol)
    }
    else{
      plot_sudoku(v$sudo)
    }
  }, width = 650, height = 650)

  observeEvent(input$mAj, {
    showNotification(v$mess)
  })

  output$info <- renderText({
    paste0(
      "numéro de la ligne :  ",
      9 - floor(input$plot_click$y - 0.5),
      "\nnuméro de la colonne :  ",
      floor(input$plot_click$x - 0.5) + 1
    )
  })
})





# Define server logic required to draw a histogram
server <- function(input, output) {
  v <- reactiveValues(
    affiche = "Pas de sudoku initialisé",
    sudo = matrix(NA, 9, 9),
    sol = matrix(NA, 9, 9),
    mess = "Bonne partie ;)",
    CHECK = " "
  )


  observeEvent(input$Nouveau, {
    tout <- game(input$difficulte)
    v$affiche <- paste("Sudoku ",
                       input$difficulte,
                       "(nombre de backtracking : ",
                       tout$back,
                       ")")
    v$sudo <- tout$sudoku
    v$sol <- tout$solution
    v$control <- tout$sudoku
  })

  observeEvent(input$Nouveau, {
    shinyalert(
      "Attention !",
      "Une fois le jeu lancé, si vous regardez la solution la partie s'arrêtera.",
      type = "info",
      showConfirmButton = T,
      confirmButtonText = "OK"
    )
  })
  observeEvent(input$check, {
    if (v$CHECK == "Félicitations vous avez réussi"){
      shinyalert(
        "Félicitaion !",
        "Vous avez réuissi à résoudre le Sudoku.",
        type = "success",
        showConfirmButton = T,
        confirmButtonText = "Une autre partie"
      )
    }
    if (v$CHECK == "Oupss, Encore un effort !"){
      shinyalert(
        "Oupsss !",
        "Encore un effort.",
        type = "error",
        showConfirmButton = T,
        confirmButtonText = "Continuer"
      )
    }
  })

  observeEvent(input$Solution, {
    v$affiche = "Voici la solution :"
  })


  observeEvent(input$mAj, {
    i = 9 - floor(input$plot_click$y - 0.5)
    j = floor(input$plot_click$x - 0.5) + 1
    if (!all(is.na(v$sudo))) {
      val <- input$valeur
      if (is.na(v$control[i, j])) {
        v$sudo[i, j] <<- val
      }

      if (!is_valid(v$sudo, i, j, v$sudo[i, j])) {
        v$mess <- "Oops, ce n'est pas juste "
      } else{
        v$mess <- "Bien joué ! Continuez "
      }
      if (!is.na(v$control[i, j])) {
        v$mess <- "Impossible de modifier cette case"
      }
    }

  })

  observeEvent(input$mAJ, {
    if (is.na(v$control[i, j])) {
      if (!is_valid(v$sudo, i, j, v$sudo[i, j])) {
        v$mess <- "Oops, ce n'est pas juste :'("
      } else{
        v$mess <- "Bien joué ! Continuez :)"
      }
      showNotification(v$mess)
    }
    else {
      v$mess <- "Impossible de remplir modifier cette case"
    }
    showNotification(v$mess)
  })

  observeEvent(input$sup, {
    i = 9 - floor(input$plot_click$y - 0.5)
    j = floor(input$plot_click$x - 0.5) + 1
    if (is.na(v$control[i, j])) {
      v$sudo[i, j]  <- NA
    }
  })

  observeEvent(input$check, {
    if (check(v$sudo)){
      v$CHECK <- "Félicitations vous avez réussi"
    }else {v$CHECK <- "Oupss, Encore un effort !"}
  })

  output$text1 <- renderText({
    v$affiche
  })

  output$plot1 <- renderPlot({
    if (v$affiche == "Voici la solution :") {
      plot_sudoku(v$sol)
    }
    else{
      plot_sudoku(v$sudo)
    }
  }, width = 650, height = 650)

  observeEvent(input$mAj, {
    showNotification(v$mess)
  })

  output$info <- renderText({
    paste0(
      "numéro de la ligne :  ",
      9 - floor(input$plot_click$y - 0.5),
      "\nnuméro de la colonne :  ",
      floor(input$plot_click$x - 0.5) + 1
    )
  })
}


# Run the application
shinyApp(ui = ui, server = server)
