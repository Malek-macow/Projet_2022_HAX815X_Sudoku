# Il faut toujours faire attention à bien appeler les bonnes fonctions.... mais
# on a un début de quelque chose

library(shiny)

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas init", sudo = matrix(NA, 9,9))

    observeEvent(input$Nouveau, {
        v$affiche <- "Wow"
        v$sudo_sol <- sudo_ele()
        })

    observeEvent(input$Solution, {
        v$affiche <- "Pour la soluce"
    })
    output$passudoku <- renderPrint({
        if (v$affiche == "Pas init") return(v$affiche)
        if (v$affiche == "Pour la soluce") return(v$affiche)
        if (v$affiche == "Wow") return(v$affiche)

    })

    output$sudoku <- renderPlot({
        if (v$affiche == "Pour la soluce"){plot_sudoku(v$sudo_sol)}
        if (v$affiche == "Wow"){plot_sudoku(play_sudo(v$sudo_sol))}})
})
