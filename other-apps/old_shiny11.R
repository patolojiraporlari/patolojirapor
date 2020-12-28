ui <- fluidPage(
    textInput("PMID", ""),
    textOutput("CodeStart"),
    textOutput("PubMedSearch"),
    textOutput("citation"),
    textOutput("e"),
    textOutput("doi"),
    textOutput("f"),
    textOutput("g"),
    textOutput("h"),
    textOutput("i"),
    textOutput("j"),
    textOutput("k"),
    textOutput("l"),
    textOutput("m"),
    textOutput("n"),
    textOutput("o")
)

server <-
    function(input, output) {
        output$CodeStart <-
            renderText({
                paste0("```{r include=FALSE}")
            })

        output$PubMedSearch <- renderText({
            paste0(
                "PMID_",
                input$PMID,
                " <- RefManageR::ReadPubMed('",
                input$PMID,
                "', database = 'PubMed')"
            )
            
        })
        
        output$citation <- renderText({
            paste0(
                "citation_",
                input$PMID,
                " <- paste0(PMID_",
                input$PMID,
                "$journal,' ', PMID_",
                input$PMID ,
                "$year, ' ', PMID_",
                input$PMID ,
                "$month,';', PMID_",
                input$PMID,
                "$volume,'(', PMID_",
                input$PMID,
                "$number,'):', PMID_",
                input$PMID,
                "$pages)"
            )
            
            
        })
        
        output$e <- renderText({
            paste0(
                "PubMed_",
                input$PMID,
                " <- paste0(PubMedString, PMID_",
                input$PMID,
                "$eprint)")
        
        })
                    
        output$doi <- renderText({
            paste0("doi_",
                input$PMID,
                " <- paste0(doiString, PMID_",
                input$PMID,
                "$doi)")
            
        })
        
        
        output$f <- renderText({
            paste0(
                "dimensionBadge_",
                input$PMID,
                " <- paste0(dimensionString1, PMID_",
                input$PMID,
                "$doi,dimensionString2)"
            )
            
            
        })
        
        
        output$g <- renderText({
            paste0(
                "altmetricBadge_",
                input$PMID,
                " <- paste0(altmetricString1, PMID_",
                input$PMID,
                "$doi, altmetricString2 )"
            )
            
        })
        
        
        output$h <- renderText({
            paste0("```")
            
        })
        
        
        output$i <- renderText({
            paste0("- **`r PMID_",
                   input$PMID,
                   "$title`**")
            
        })
        
        
        output$j <- renderText({
            paste0("*`r citation_",
                   input$PMID,
                   "`*")
            
        })
        
        
        output$k <- renderText({
            paste0("`r PMID_",
                   input$PMID,
                   "$abstract`")
            
        })
        
        
        output$l <- renderText({
            paste0("`r PubMed_", input$PMID, "`")
            
            
        })
        
        
        output$m <- renderText({
            paste0(" `r doi_", input$PMID, "`")
            
            
        })
        
        
        output$n <- renderText({
            paste0("       `r dimensionBadge_",        input$PMID,        "`")
            
            
        })
        
        
        output$o <- renderText({
            paste0("       `r altmetricBadge_",        input$PMID,        "`")
            
            
        })
        
        
        
        
        
        
        
    }

shinyApp(ui = ui, server = server)
