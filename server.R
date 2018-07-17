
shinyServer(function(input, output) {
        model <- nls(carat ~ a*price^b, data = diamonds, start = list(a=1,b=1))
        
        modelPredict <- reactive({
                priceInput <- input$sliderPrice
                predict(model, newdata = data.frame(price = priceInput))
        })
        output$plot <- renderPlot({
                priceInput <- input$sliderPrice
                
                plot(diamonds$price, diamonds$carat, col = "grey",
                     xlab = "Diamond Price", ylab = "Diamond Carat",
                     bty = "n", pch = 16, xlim = c(300, 20000), ylim = c(0.1, 5.05))
                lines(diamonds$price, predict(model), type = "l", lwd = 0.1)
                points(priceInput, modelPredict(), col = "red", pch = 16, cex = 2)
        })
        
        output$pred <- renderText({
                modelPredict()
        })
        
        output$text <- renderText({
                "This Shiny app was created to predict the carat of a dimond, based on the price that the customer is willing to pay. The user can simply move the slider left and right, select the price he/she is willing to pay for a diamond, and find out what its carat would be. The calculation is done in the Plot section. This Shiny app uses the Diamonds dataset, pre-loaded in R. In addition, the app uses Nonlinear Least Squares model for more accurate prediction (compared to Linear Model). The monetary limit ranges from $300 to $20,000. As a default price has been chosen $5,051, as the average spending limit preffered by a customer."
        })
})