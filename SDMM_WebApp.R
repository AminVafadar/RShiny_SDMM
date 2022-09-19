#This web app uses SDMM function by taking the inputs from decision makers 


# load R packages
library(shiny)
library(shinythemes)
library(shinyMatrix)
library(DT)

source("SDMM_Function_EMV2.R", local=TRUE)


#define UI
ui <- fluidPage(theme=shinytheme("cerulean"), uiOutput("moreControls"),
                navbarPage(
                  "Stratified Decision Making Model Tool",
                  tabPanel("Input Parameters",
                           sidebarPanel(
                             tags$h3("Input Parameters:"),
                             numericInput("NN","Number of Status:", value=2, min=2, max=10), #NN will be sent to the server
                             numericInput("MM","Number of Outcomes:", value=2, min=2, max=10), #MM will be sent to the server
                             numericInput("BB","Number of Strategies:", value=2, min=2, max=10), #BB will be sent to the server
                             
                             
                             
                           ), #sidebarPanel
                           
                  ), #Input Parameters, tabPanel
                  tabPanel("Input Matrices P and Q", 
                           tags$h3("Input Matrix P:"),
                           matrixInput(
                             "PP",
                             value = diag(3),
                             rows = list(names = FALSE),
                             cols = list(names = FALSE),
                             class = "numeric"
                           ),
                           
                           tags$h3("Input Matrix Q:"),
                           matrixInput(
                             "QQ",
                             value = diag(3),
                             rows = list(names = FALSE),
                             cols = list(names = FALSE),
                             class="numeric"
                           ),
                           
    
                           
                  ),
                  
                 tabPanel("Input Utility Matrix",
                           tags$h3("Input Utility Matrix:"),
                          matrixInput(
                            "UU",
                            value = diag(3),
                            rows = list(names = FALSE),
                            cols = list(names = FALSE),
                            class="numeric"
                          ),
                           
              
                           
                  ),
                  tabPanel("Results", 
                           
                           mainPanel(
                             h1("Expected Monetary Value (EMV):"),
                             DT::dataTableOutput("mytable"),
                             h3("Order of Strategies:"),
                             verbatimTextOutput("value"), #value is generated from the server
                             actionButton("myButton","Start Analysis")
                           ) #mainPanel
                  ),
                  
                  
                  
                ) #navbarPage
) #fluidPage



#Define server function
server <- function(input, output,session) {
  
  observeEvent(input$NN,{
    updateMatrixInput(session,"PP",value=diag(input$NN))
    
  })
  
  observeEvent(input$MM,{
    updateMatrixInput(session,"QQ",value=diag(input$MM))
  })
  
  observeEvent({input$BB| input$MM |input$NN},{
    updateMatrixInput(session,"UU",value = matrix("", input$BB, (input$MM)*(input$NN)))
  })
  

  observeEvent(input$myButton, {
    
    
    a<-SDMM_Function_EMV2(input$NN,input$MM,input$BB,input$PP,input$QQ,input$UU)
    
    output$mytable = DT::renderDataTable({
      a
    })
    
    output$value <- renderText({
      order(a, decreasing=TRUE)
    })
  })
  
  
  
} #server



#Create shiny object
shinyApp(ui=ui, server=server)

