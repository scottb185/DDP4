Monthly Payment/Total Interest Paid for 30 YEAR vs. 15 YEAR Fixed-Rate Mortgage by Interest Rate
========================================================
author: scottb185
date: Thu Dec 17 14:10:13 2015


Introduction
========================================================

- This is a calculator which tells you your required monthly payment and total 
interest paid for a 30-Year vs. 15-Year mortgage by interest rate and amount borrowed.


Governing Equations
========================================================

- P = the principal (the initial amount you borrowed, 'amt' in code)
- i = the MONTHLY interest rate 
- n = # of payments (n=360 for 30 year, n=180 for 15 year mortgage) 

- M = monthly mortgage payment = P[i(1+i)^n ] / [(1+i)^n -1]
- Total Interest Paid = (M * n) - P  


Results are for this exercise only!    


Instructions 
======================================================== 

- Just enter values for amount borrowed, 15Y and 30Y interest rates and hit the 
submit button.
- The app will then calculate the monthly payment for each type
of mortgage (15Y and 30Y), show you the total interest you will be paying 
over the life of the loan, and the total interest paid difference between the 
two loans.  



Calculation (server.R file) 
======================================================== 

- The server.R file controls what the app does (crunches the numbers):  


```r
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
```


User Interface (ui.R file)
========================================================
- The ui.R file controls how the user interface looks:


```r
library(shiny)
shinyUI(pageWithSidebar( 
headerPanel("Monthly Payment/Total Interest Paid for 30 YEAR vs. 15 YEAR Fixed-Rate Mortgage by Interest Rate"), 
sidebarPanel( 
h4('INSTRUCTIONS: enter size of mortgage ($), 30 and 15 year interest rates (%) and hit SUBMIT button:'), 
numericInput('amt', 'Enter size of mortgage ($):', 100000, min=1), 
numericInput('rate30', 'Enter 30 YEAR annual interest rate (%):', 3.75, min=0.01), 
numericInput('rate15', 'Enter 15 YEAR annual interest rate (%):', 4.00, min=0.01), 
submitButton('Submit'),

wellPanel( 
helpText(   a("Click here for lendingtree website", 
href="https://www.lendingtree.com")))
), 
mainPanel( 
h3('Here is the DATA YOU ENTERED:'), 
h4('The size of mortgage you entered ($):'),
verbatimTextOutput("inputValue3"),
h4('The 30 YEAR annual interest rate you entered (%):'),
verbatimTextOutput("inputValue1"),
h4('The 15 YEAR annual interest rate you entered (%):'),
verbatimTextOutput("inputValue2"),
h3('Here are the RESULTS:'), 
h4('30 YEAR: monthly payment ($):'), 
verbatimTextOutput("payment30"),
h4('15 YEAR: monthly payment ($):'), 
verbatimTextOutput("payment15"),
h4('30 YEAR: total interest you pay over life of loan ($):'), 
verbatimTextOutput("totalint30"),
h4('15 YEAR: total interest you pay over life of loan ($):'), 
verbatimTextOutput("totalint15"),
h4('EXTRA TOTAL INTEREST you pay with 30 YEAR loan over that of 15 YEAR loan ($):'), 
verbatimTextOutput("intsaved")

) 
)
)
```

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Monthly Payment/Total Interest Paid for 30 YEAR vs. 15 YEAR Fixed-Rate Mortgage by Interest Rate</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<h4>INSTRUCTIONS: enter size of mortgage ($), 30 and 15 year interest rates (%) and hit SUBMIT button:</h4>
<div class="form-group shiny-input-container">
<label for="amt">Enter size of mortgage ($):</label>
<input id="amt" type="number" class="form-control" value="100000" min="1"/>
</div>
<div class="form-group shiny-input-container">
<label for="rate30">Enter 30 YEAR annual interest rate (%):</label>
<input id="rate30" type="number" class="form-control" value="3.75" min="0.01"/>
</div>
<div class="form-group shiny-input-container">
<label for="rate15">Enter 15 YEAR annual interest rate (%):</label>
<input id="rate15" type="number" class="form-control" value="4" min="0.01"/>
</div>
<div>
<button type="submit" class="btn btn-primary">Submit</button>
</div>
<div class="well">
<span class="help-block">
<a href="https://www.lendingtree.com">Click here for lendingtree website</a>
</span>
</div>
</form>
</div>
<div class="col-sm-8">
<h3>Here is the DATA YOU ENTERED:</h3>
<h4>The size of mortgage you entered ($):</h4>
<pre id="inputValue3" class="shiny-text-output"></pre>
<h4>The 30 YEAR annual interest rate you entered (%):</h4>
<pre id="inputValue1" class="shiny-text-output"></pre>
<h4>The 15 YEAR annual interest rate you entered (%):</h4>
<pre id="inputValue2" class="shiny-text-output"></pre>
<h3>Here are the RESULTS:</h3>
<h4>30 YEAR: monthly payment ($):</h4>
<pre id="payment30" class="shiny-text-output"></pre>
<h4>15 YEAR: monthly payment ($):</h4>
<pre id="payment15" class="shiny-text-output"></pre>
<h4>30 YEAR: total interest you pay over life of loan ($):</h4>
<pre id="totalint30" class="shiny-text-output"></pre>
<h4>15 YEAR: total interest you pay over life of loan ($):</h4>
<pre id="totalint15" class="shiny-text-output"></pre>
<h4>EXTRA TOTAL INTEREST you pay with 30 YEAR loan over that of 15 YEAR loan ($):</h4>
<pre id="intsaved" class="shiny-text-output"></pre>
</div>
</div>
</div><!--/html_preserve-->


