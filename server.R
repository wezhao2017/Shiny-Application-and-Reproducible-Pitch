library(shiny)

shinyServer(function(input, output) {
        values <- reactiveValues()
        observe({
                input$YourBMI
                values$bmi <- isolate({
                        input$mass_kg/(input$height_cm/100 * input$height_cm/100)
                        })
                })
        output$current_weight <- renderText({
                input$YourBMI
                paste("Current Weight(KG): ", isolate(input$mass_kg))
                })
        output$current_height <- renderText({
                input$YourBMI
                paste("Current Height(CM) :", isolate(input$height_cm))
                })
        output$indicator_show <- renderText({
                if(input$YourBMI == 0) "" else {
                        if (values$bmi < 18.5){
                                values$indicator_show = "Underweight"
                                }
                        else if (values$bmi < 24.9){
                                values$indicator_show ="Normal weight"
                                }
                        else if (values$bmi < 29.9){
                                values$indicator_show ="Overweight"
                                }
                        else{
                                values$indicator_show ="Obesity"
                                }
                        paste("", values$indicator_show)
                        }
                })
        output$BMI_result <- renderText({
                if(input$YourBMI == 0) "" else
                        paste("", values$bmi)
                })
        })

