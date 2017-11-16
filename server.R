#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyr)
library(plotly)

raw.data <- read.csv("./data/survey_Responses.csv", stringsAsFactors = FALSE)
raw.data <- raw.data %>% 
              select(Participant.ID, Response, Poll.Title)
data <- spread(raw.data, key = Poll.Title, value = Response)
colnames(data) <- c("id", "pet", "sleep", "ta.help", "raingear")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
 
  output$distPlot <- renderPlotly({
    # Filter Data 
    chart.data <- data %>% filter(as.numeric(sleep) > as.numeric(input$hours))
    
    plot_ly(x = chart.data$ta.help, y = as.numeric(chart.data$sleep), type = "scatter", color = chart.data$pet) %>% 
      layout(xaxis = list(title = "TA Help"))
  
  })
  
  output$histPlot <- renderPlotly({
    plot_ly(x = data[input$hist.var], type = "histogram") %>% 
      layout(xaxis = list(title = input$hist.var))
    
  })
  
})
