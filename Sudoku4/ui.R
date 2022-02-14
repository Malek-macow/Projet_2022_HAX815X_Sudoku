library(shiny)

shinyUI(fluidPage(
    titlePanel("Premiers tests pour le sudoku"),

    sidebarLayout(
        sidebarPanel(
            actionButton("Nouveau", label = "Générer nouveau Sudoku"),
            actionButton("Solution", label = "Solution")
        ),

        mainPanel(
            verbatimTextOutput("passudoku"),
            plotOutput("sudoku")
        )
    )
))
