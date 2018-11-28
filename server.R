# Data Science Capstone Final Project
# Server.R for the Shiny app

(library(tm))
(library(stringr))
(library(shiny))


setwd('C:/Users/innugantii/Desktop/Indu/Coursera/Project Final/final/en_US')

# source
source('C:/Users/innugantii/Desktop/Indu/Coursera/Project Final/final/en_US/Cleansing.R')
source('C:/Users/innugantii/Desktop/Indu/Coursera/Project Final/final/en_US/Predict_backoff_Algo.R')

# load N_Gram Data frame files

load("fDF1.RData");
load("fDF2.RData");
load("fDF3.RData");
load("fDF4.RData");

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

