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

    observeEvent(input$Solution, {
        v$affiche <- "Voici la solution :"
    })

    observeEvent(input$mAj, {
        if(!all(is.na(v$sudo))){
        i <- input$ligne
        j <- input$colonne
        val <- input$valeur
        v$sudo[i, j] <- val
        if (v$sudo[i,j]!=v$sol[i,j]){
            v$sudo[i, j] <- NA
            v$mess <- "Oops, ce n'est pas juste :'("
        }else{
            v$mess <- "Bien joué ! Continuez :)"
    }
    }
    })
    output$passudoku <- renderPrint({
        return(v$affiche)
        })

    output$sudoku <- renderPlot({
        if (v$affiche == "Voici la solution :"){plot_sudoku(v$sol)}
        else{plot_sudoku(v$sudo)}
    }, width = 400, height = 400)

    output$juste <- renderPrint({
        return(v$mess)
    })
})
