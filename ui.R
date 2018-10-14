library(shiny)
shinyUI(fluidPage(
  titlePanel("Body Mass Index Calculator"),
  sidebarLayout(sidebarPanel(
    helpText("Input your weight(in kg) and your height(in inches)"),
    sliderInput(
      inputId = "mass",
      label = strong("Your weight in kg:"),
      min = 41,
      max = 130,
      value = 86
    ), 
    sliderInput(
      inputId = "height",
      label = strong("Your height in inches:"),
      min = 58,
      max = 76,
      value = 67
    ),
    em("Defenition of BMI"),
    h6("Body mass index (BMI) is a measure of body fat based on your weight in relation to your height, and applies to most adult men and women aged 20 and over."),
    em("History"),
    h6("Adolphe Quetelet, a Belgian astronomer, mathematician, statistician and sociologist, devised the basis of the BMI between 1830 and 1850 as he developed what he called social physics.The modern term body mass index (BMI) for the ratio of human body weight to squared height was coined in a paper published in the July 1972 edition of the Journal of Chronic Diseases by Ancel Keys and others.")
  ),
  mainPanel(
    uiOutput("user"),
    plotOutput("plot", height = "180px", width = "100%"), 
    uiOutput("results") 
  ))
))