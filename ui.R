
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
        titlePanel("Predict Diamond Carat from Price"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderPrice", "How much can you spend in USD?",
                                    300, 20000, value = 5051)
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plot",
                                         plotOutput("plot"),
                                         h3("Predicted Diamond Carat"),
                                         textOutput("pred")),
                                tabPanel("Documentation", verbatimTextOutput("text")))
                )
        )
))