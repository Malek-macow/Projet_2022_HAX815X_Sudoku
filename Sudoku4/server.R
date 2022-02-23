library(shiny)
library(shinyWidgets)
devtools::load_all()

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas de sudoku initialisé", sudo = matrix(NA, 9,9))

    observeEvent(input$Nouveau, {
        v$affiche <- paste("Sudoku", input$difficulte)
        v$sudo_sol <- get_sudo()
        })

    observeEvent(input$Solution, {
        v$affiche <- "Voici la solution :"
    })
    output$passudoku <- renderPrint({
        if (v$affiche == "Pas de sudoku initialisé") return(v$affiche)
        if (v$affiche == "Voici la solution :") return(v$affiche)
        if (v$affiche == paste("Sudoku", input$difficulte)) return(v$affiche)

    })

    output$sudoku <- renderPlot({
        if (v$affiche == "Pas de sudoku initialisé"){plot_sudoku(v$sudo_sol)}
        if (v$affiche == "Voici la solution :"){plot_sudoku(v$sudo_sol)}
        if (v$affiche == paste("Sudoku", input$difficulte)){plot_sudoku(play_sudo(v$sudo_sol))}
    }, width = 400, height = 400)
})
