# Data Science Capstone Final Project
# ui.R file for Shiny app

suppressWarnings(library(shiny))
library(shinyWidgets)

shinyUI(fluidPage(
        setBackgroundColor(
                color = c("#F7FBFF", "#2171B5"),
                gradient = "linear",
                direction = "bottom"
        ),
                 titlePanel("Data Science Capstone Project - Predict Next Word"),br(),
                 
                 fluidRow(HTML("<strong>Author: Innuganti</strong>")),
                 fluidRow(HTML("<strong>Date: 27 November 2018</strong>")),br(),
        
        fluidRow(
                br(),
                p(" Katz's Back-off algorithm to predict the next word after user enters a partial sentence.")),
        br(),
        br(),
        
        fluidRow(h5(HTML("<strong> Input a word or partial sentence and press \"Predict Next Word\" button to predict the next word</strong>"))),
        fluidRow( p("\n") ),
        
        # Sidebar 
        sidebarLayout(
                
                sidebarPanel(
                       h5(textInput("inputString", "Enter a word or partial sentence",value = "")),
                       
                        tags$style(type='text/css', '#inputString {background-image: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1)); color: blue;}'),
                        submitButton("Predict Next Word")),
                
                mainPanel(
                        h3("Predicted Next Word"),
                        h4( verbatimTextOutput("prediction")),
                        tags$style(type='text/css', '#prediction {background-image: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1)); color: blue;}'),
                        strong("Sentence Input:"),
                        tags$style(type='text/css', '#text1 {background-color: rgba(255,255,0,0.40); color: blue;}'), 
                        textOutput('text1'),
                        br(),
                       
                        textOutput('text2')
                        
                
                )
        )
        ))

    