library(shiny)
library(shinythemes)
library(shinyWidgets)

shinyUI(fluidPage(theme = shinytheme("superhero"),
    titlePanel("Sudoku4"),

    sidebarLayout(
        sidebarPanel(
            actionBttn("Nouveau", label = "Générer nouveau Sudoku", style ="stretch",
                       color = 'default'),
            actionBttn("Solution", label = "Solution", style = "gradient", color='succes')
        ),
        mainPanel(
            verbatimTextOutput("passudoku"),
            plotOutput("sudoku")        )
    )
))
