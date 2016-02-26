library (shiny)
library(psych)

ui<-fluidPage(
  fileInput("archivo", "Elige un archivo", multiple = FALSE),
  plotOutput("grafica"),
  tableOutput("resumen")
)

