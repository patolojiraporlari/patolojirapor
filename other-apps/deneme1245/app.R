library(shiny)

fieldsAll <- c("valuePancreas", "valueAmpulla", "PMID")

saveData <- function(mydata) {
    saveRDS(mydata, "mydata.rds")
}


loadData <- function() {
    files <- list.files(file.path(responsesDir), full.names = TRUE)
    data <- lapply(files, readRDS, stringsAsFactors = FALSE)
    #data <- dplyr::rbind_all(data)
    data <- do.call(rbind, data)
    data
}


responsesDir <- file.path("responses")





ui <- fluidPage(
    
    textInput("PMID", ""),
    checkboxInput("checkboxPancreas", label = "Pancreas", value = FALSE),
    checkboxInput("checkboxAmpulla", label = "Ampulla", value = FALSE),
    
    hr(),
    fluidRow(column(3, verbatimTextOutput("valuePancreas"))),
    fluidRow(column(3, verbatimTextOutput("valueAmpulla"))),
    fluidRow(column(3, verbatimTextOutput("myPMID")))
    
) 


server <- function(input, output) {
    
    
    observe({
      fieldsAll
        })
    
    formData <- reactive({
        data <- sapply(fieldsAll, function(x) input[[x]])
        data
    })  
    
    
    
    

    output$myPMID <- renderText({ trimws(input$PMID) })
    
    output$valuePancreas <- renderPrint({ input$checkboxPancreas })
    
    output$valueAmpulla <- renderPrint({ input$checkboxAmpulla })
}


# Run the application 
shinyApp(ui = ui, server = server)
