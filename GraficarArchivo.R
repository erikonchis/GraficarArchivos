library (shiny)
library(psych)

ui<-fluidPage(
  fileInput("archivo", "Elige un archivo", multiple = FALSE),
  plotOutput("grafica"),
  tableOutput("resumen")
)
options(shiny.maxRequestSize=30*1024^2) 
server<-function(input, output){
  datos<-reactive({
    archivog<-input$archivo
    if (is.null(archivog)) return (NULL)
    read.csv(archivog$datapath, sep="", header=TRUE)
  })
  output$grafica<-renderPlot({plot(datos())})
  output$resumen<-renderTable(describe(datos()))
  datos
}

shinyApp(ui, server)  
