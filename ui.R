library(shiny)
library(plotly)

my.ui <- navbarPage(
  
  # Application title
  "In Class Survey Data",
  
  # Sidebar with a slider input for number of bins 
  tabPanel("ScatterPlot",
           sidebarLayout(
             sidebarPanel(
               sliderInput("hours",
                           "Minimum number of hours:",
                           min = 0,
                           max = 24,
                           value = 4)
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotlyOutput("distPlot")
             )
           )
  ),
  tabPanel("Histogram",
           sidebarLayout(
             sidebarPanel(
               selectInput('hist.var', "What do you want to histogram?", 
                           choices = list("How much sleep?" = "sleep",
                                          "Which type of pet?" = "pet"
                           )
               )
             ),
             
             # Show a plot of the generated distribution
             mainPanel(
               plotlyOutput("histPlot")
             )
           )
  )
)
# Define UI for application that draws a histogram
shinyUI(my.ui)