# Il faut toujours faire attention à bien appeler les bonnes fonctions.... mais
# on a un début de quelque chose
# WARNING : installer le package shinythemes

library(shiny)

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas de sudoku initialisé", sudo = matrix(NA, 9,9))

    observeEvent(input$Nouveau, {
        v$affiche <- "Sudoku"
        v$sudo_sol <- get_sudo(sudo_ele())
        })

    observeEvent(input$Solution, {
        v$affiche <- "Voici la solution :"
    })
    output$passudoku <- renderPrint({
        if (v$affiche == "Pas de sudoku initialisé") return(v$affiche)
        if (v$affiche == "Voici la solution :") return(v$affiche)
        if (v$affiche == "Sudoku") return(v$affiche)

    })

    output$sudoku <- renderPlot({
        if (v$affiche == "Pas de sudoku initialisé"){plot_sudoku(v$sudo_sol)}
        if (v$affiche == "Voici la solution :"){plot_sudoku(v$sudo_sol)}
        if (v$affiche == "Sudoku"){plot_sudoku(play_sudo(v$sudo_sol))}})
})
