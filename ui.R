library(shiny)

ui <- fluidPage(
  
  # Getting inputs for the server file
  titlePanel("A basic Monte Carlo, September 27th 2018"),
  
  sidebarLayout(
    
    # Sidebar 
    sidebarPanel(
      
      # Requirements for a triangular distribution are min, max and most likely
      # To improve, add p-value and number of bins to the input list
      sliderInput(inputId = "min",
                  label = "Step 1. Set the minimal value the risk can take.",
                  min = 0,
                  max = 50000000,
                  value = "",
                  step = 100000),
      sliderInput(inputId = "max",
                  label = "Step 2. Set the maximal value the risk can take.",
                  min = 0,
                  max = 50000000,
                  value = "",
                  step = 100000),
      sliderInput(inputId = "median",
                  label = "Step 3. Set the most likely value the risk can take",
                  min = 0,
                  max = 50000000,
                  value = "",
                  step = 100000),
      sliderInput(inputId = "p",
                  label = "p value of the risk",
                  min = 0,
                  max = 1,
                  value = 0.8),
      sliderInput(inputId = "bins",
                  label = "Amount of bins:",
                  min = 1,
                  max = 100,
                  value = 50)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot"),
      textOutput(outputId = "quantiles")
      
    )
  )
)
