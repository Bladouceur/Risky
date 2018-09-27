library(shiny)
library(triangle)
options(scipen = 99)
# After setup, the goal of this function is to compute and produce the graphics
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x    <- rtriangle(10000,input$min,input$max,input$median)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = input$bins, col = "darkgreen", border = "white",
         xlab = "Value of the risk",
         main = "Triangular distribution of the risk")
    
    y <- round(quantile(x, c(input$p)),0)
    abline(v = y, col="red", lwd=3, lty=2)
    y1 <- c("The p",input$p*100," value of the risk is ",y)
    output$quantiles <- renderText({ 
      paste(y1)
    })
    
  })
  
}