library(UsingR)
library(shiny)
data(galton)
shinyServer(
  function(input,output){
    output$newHist <- renderPlot({
      n<-2^12
      time <- (1:n)/1e6#2^12 #uS
      sf <- input$fr #signal frequency
      wn <- input$wn #phase noise
      y<-sin(2*pi*time*sf)+rnorm(n,mean=0,sd=wn)
      #@1000us = 1ms, f=1k, >2pi  1000/1000
      par(mfrow=c(2,1))
      plot(time,y,type="l",col="red",ylim=c(-2,2),xlab="Time (Seconds)")
      titleStr <- paste0("sine wave, amplitude of 1 at ",as.character(sf),"Hz, plus noise")
      title(titleStr)
      fftDf <- data.frame(frequency=(1:(n/2))*1e6/4096,signalFFT=abs(fft(y))[1:(n/2)]/(n/2))
      with(fftDf[1:500,],plot(frequency,signalFFT,xlab="Frequency(Hz)",ylab="FFT(y)",type="l"))
      title("FFT")
    })
  }
)