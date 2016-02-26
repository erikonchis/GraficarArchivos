library(psych)
shinyServer(
  function(input, output){
  datos<-reactive({
    archivog<-input$archivo
    if (is.null(archivog)) return (NULL)
    read.csv(archivog$datapath, sep="", header=TRUE)
  })
  output$grafica<-renderPlot({plot(datos())})
  output$resumen<-renderTable(describe(datos()))
  datos
}
)