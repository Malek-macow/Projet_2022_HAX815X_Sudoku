# Attention, pour que ça fonctionne il faut pour l'instant initialisé sudo_ele sinon il
# sait pas de quoi on parle.

library(shiny)
library(DT)

shinyServer(function(input, output) {
    v <- reactiveValues(affiche="Pas init", sudo = matrix(NA, 9,9))

    observeEvent(input$Nouveau, {
        v$affiche <- "Wow"
        v$sudo <- sudo_ele()
        })

    observeEvent(input$Solution, {
        v$affiche <- "Pour la soluce"
    })
    output$passudoku <- renderPrint({
        if (v$affiche == "Pas init") return(v$affiche)
        if (v$affiche == "Pour la soluce") return(v$affiche)
        if (v$affiche == "Wow") return(v$affiche)

    })

    output$sudoku <- renderPlot({plot_sudoku(v$sudo)})

})
