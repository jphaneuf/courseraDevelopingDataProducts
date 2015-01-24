#Developing Data Products Project


library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("FFT Sliderzzz"),
  sidebarPanel(
    sliderInput('fr','choose frequency',value=244,min=200,max=1e5,step=1),
    sliderInput('wn','Add noise to signal',value=0,min=0,max=3,step=.01)
  ),
  mainPanel(
    p("Adjust the frequency slider to change the frequency of your signal"),
    p("Adjust the noise slider to punch your signal in the face"),
    p("Observe your signal magically emerging from  the noise in the frequency domain"),
    p("Is it magic?  No.  It's a Fourier Transform."),
    plotOutput('newHist')
  )
))