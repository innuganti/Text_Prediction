# Data Science Capstone Final Project
# Server.R for the Shiny app

(library(tm))
(library(stringr))
(library(shiny))

# load N_Gram Data frame files

load("unigram.RData");
load("bigram.RData");
load("trigram.RData");
load("quadgram.RData");

mesg <- as.character(NULL);msg <- ""

shinyServer(function(input, output) {
        output$prediction <- renderPrint({
                str2 <- CleanInputString(input$inputString);
                strDF <- PredNextTerm(str2);
                input$action;
                msg <<- as.character(strDF[1,2]);
                cat("", as.character(strDF[1,1]))
                cat("\n\t");
                cat("\n\t");
                cat("Note: ", as.character(strDF[1,2]));
        })
        
        output$text1 <- renderText({
                paste("Input Sentence: ", input$inputString)});
        
        output$text2 <- renderText({
                input$action;
                
        })
}
)

