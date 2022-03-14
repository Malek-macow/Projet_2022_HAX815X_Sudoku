#' @title Application shiny
#'
#' @description Cette fonction lance l'application shiny
#' @imports shiny shinyalert shinythemes shinyWidgets
#' @export
#'

runGame=function(){

  appDir <- system.file("MALEX_application",package ="MALEX")
  shiny::runApp(appDir)
}
