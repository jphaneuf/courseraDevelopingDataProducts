#Developing Data Products Project


library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('fr','choose frequency',value=244,min=200,max=1e5,step=1),
    sliderInput('wn','Add noise to signal',value=0,min=0,max=3,step=.01)
  ),
  mainPanel(
    plotOutput('newHist')
  )
))