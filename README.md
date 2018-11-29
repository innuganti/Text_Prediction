# Text_Prediction
Data Science Final Project
Shiny app link: https://innugantii.shinyapps.io/PredictNextWord/

# Introduction:

The Objective of this Capstone Project is to build an application that anticipates next word which can be deployed in a Shiny app. 
A smart word prediction Shiny app is built using transformed corpus of text files.
This project was the final project of Data Science Specialization by John Hopkins University on Coursera and it is an industry partnership with SwiftKey

# Key features
 Invloved the following steps:
 
* Acquisition of data from Coursera 
* Data wrangling for transforming and mapping
* Use of Katz Backoff Algorithm
* Application Development

# Word Prediction Algorithm
* The app predicts next word when user input a word or partial sentence, the algorithm uses quadgram if the evidence is sufficient      otherwise it uses trigram, otherwise bigram then unigram. It continue backing off until it reach a history that has some counts. 



