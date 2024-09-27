library(shiny)
ui <- fluidPage(
  textInput(inputId = "name",
            label = "What is your name?"),
  numericInput(inputId = "number1",
               label = "Enter a number",
               value = 12,
               min = 0,
               max = 200),
  numericInput(inputId = "number2",
               label = "Enter a number",
               value = 12,
               min = 0,
               max = 200),
  actionButton(inputId = "click",
               label = "Click Me!"),
  textOutput(outputId = "text"),
  verbatimTextOutput(outputId = "code")
)
server <- function(input, output, session) {

  name <- eventReactive(input$click, {
    input$name
  })

  number1 <- eventReactive(input$click, {
    input$number1
  })

  number2 <- eventReactive(input$click, {
    input$number2
  })

  output$text <- renderText({
    paste0("Hello ", name(), "!")
  })
  output$code <- renderPrint({
    number1() * number2()
  })
}
shinyApp(ui, server)
