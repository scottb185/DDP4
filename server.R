
## This is shiny project file 2 of 2: the server file,  
## which controls what it does.   

monthly30<- function(rate30,amt) amt*((rate30/1200)*((rate30/1200+1)^360))/(((rate30/1200+1)^360)-1) 
monthly15<- function(rate15,amt) amt*((rate15/1200)*((rate15/1200+1)^180))/(((rate15/1200+1)^180)-1) 

library(shiny) 
library(UsingR) 

shinyServer( 
function(input, output) { 
output$inputValue1 <- renderPrint({input$rate30})
output$inputValue2 <- renderPrint({input$rate15})
output$inputValue3 <- renderPrint({input$amt})
output$payment30 <- renderPrint({monthly30(input$rate30,input$amt)})
output$totalint30 <- renderPrint({monthly30(input$rate30,input$amt)*360-(input$amt)})
output$payment15 <- renderPrint({monthly15(input$rate15,input$amt)})
output$totalint15 <- renderPrint({monthly15(input$rate15,input$amt)*180-(input$amt)})
output$intsaved <- renderPrint({monthly30(input$rate30,input$amt)*360-monthly15(input$rate15,input$amt)*180})
}
) 

