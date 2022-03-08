library(shiny)
library(shinyWidgets)
devtools::load_all()

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas de sudoku initialisé",
                        sudo = matrix(NA, 9,9),
                        sol = matrix(NA, 9,9),
                        mess = "Bonne partie ;)")


    observeEvent(input$Nouveau, {
        tout <- game(input$difficulte)
        v$affiche <- paste("Sudoku ", input$difficulte,
                           "(nombre de backtracking : ", tout$back,")")
        v$sudo <- tout$sudoku
        v$sol <- tout$solution
        })

    observeEvent(input$Nouveau, {

      shinyalert("Attention !", "Une fois vous commencez si vous regarder la solution la partie s'arrétera.",
                 type ="info",showConfirmButton = T, confirmButtonText = "OK")
    })

    observeEvent(input$Solution, {
      v$affiche = "Voici la solution :"
    })


    observeEvent(input$mAj, {
      i = 9-floor(input$plot_click$y-0.5)
      j = floor(input$plot_click$x-0.5)+1
        if(!all(is.na(v$sudo))){
          val <- input$valeur
          v$sudo[i, j] <<- val
          if (!is_valid(v$sudo, i, j, v$sudo[i,j])){
            v$mess <- "Oops, ce n'est pas juste "
            }else{
              v$mess <- "Bien joué ! Continuez "
            }
          }
    })

    observeEvent(input$mAJ, {
      if (!is_valid(v$sudo, i, j, v$sudo[i,j])){
        v$mess <- "Oops, ce n'est pas juste :'("
      }else{
        v$mess <- "Bien joué ! Continuez :)"
      }
      showNotification(v$mess)
    })

    observeEvent(input$sup, {
      i = 9-floor(input$plot_click$y-0.5)
      j = floor(input$plot_click$x-0.5)+1
      v$sudo[i, j]  <- NA
    })

    output$passudoku <- renderPrint({
      return(v$affiche)
      })

    output$plot1 <- renderPlot({
      if (v$affiche == "Voici la solution :"){plot_sudoku(v$sol)}
      else{plot_sudoku(v$sudo)}
    }, width = 500, height = 500)

    observeEvent(input$mAj, {
      showNotification(v$mess)
    })

    output$info <- renderText({
        paste0("numéro de la ligne :  ", 9-floor(input$plot_click$y-0.5),"\nnuméro de la colonne :  ", floor(input$plot_click$x-0.5)+1)
    })
})

