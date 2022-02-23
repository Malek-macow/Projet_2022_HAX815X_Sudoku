library(shiny)
library(shinyWidgets)
devtools::load_all()

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas de sudoku initialisé", sudo = matrix(NA, 9,9))

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
    output$passudoku <- renderPrint({
        return(v$affiche)
        })

    output$sudoku <- renderPlot({
        if (v$affiche == "Voici la solution :"){plot_sudoku(v$sol)}
        else{plot_sudoku(v$sudo)}
    }, width = 400, height = 400)
})
