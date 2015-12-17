
## This is shiny project file 1 of 2: the ui file (for user interface), 
## which controls how it looks 

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





