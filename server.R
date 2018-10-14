library(shiny)
p <-matrix(c(15, 3.5, 6 ,5 , 5, 5, 0.7), ncol = 1, nrow = 7)
shinyServer(function(input, output) {
  output$user <- renderText({
    paste0("<strong>","Your mass in Kg is ", input$mass, " kg and your height is ", input$height, " inches", "</strong>")
  })
  output$results <- renderText({
    BMI = round(input$mass/(input$height*0.0254)^2, 1)
    if      (BMI <=  14.9) condition = "<span style='color: red4'> Severely underweight</span>"
    else if (BMI >15 && BMI <= 18.4) condition = "<span style='color: darkorange3'> Underweight</span>"
    else if (BMI >18.5 && BMI <= 24.9) condition = "<span style='color: green'> Normal </span>"
    else if (BMI > 25 && BMI <= 29.9) condition = "<span style='color: darkorange2'> Overweight</span>"
    else if (BMI > 30 && BMI <= 34.9) condition = "<span style='color: red2'> Class I Obesity</span>"
    else if (BMI > 35 && BMI <= 39.9) condition = "<span style='color: red3'> Class II Obesity</span>"
    else condition = "<span style='color: red4'> Class III Obesity</span>"
    paste0("Your BMI is ","<strong>", BMI, "</strong>","<br>", " It is ", condition, " according to ", "<a href='http://www.whathealth.com/BMI/chart-feetkilos.html'>","whathealth.com","</a>", " and ", "<a href='https://www.thecalculatorsite.com/health/charts/BMI-chart.php'>"," thecalculatorsite.com", "</a>")
  })
  output$plot <- renderPlot({
    BMI = round(input$mass/(input$height*0.0254)^2, 1)
    if (BMI>40) {BMI=40}
    barplot(p, horiz = TRUE, yaxt="n", main="Your BMI", col=c("red4", "darkorange3", "green", "darkorange2", "red2", "red3", "red4"))
    lines(x=c(BMI, BMI), y=c(0,1.2), col="black", lwd=3.5)
  })
})