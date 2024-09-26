library(shiny)
ui <- fluidPage(
  textInput(inputId = "name",
            label = "What is your name?"),
  numericInput(inputId = "number",
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
  output$text <- renderText({
    "Hello friend!"
  })
  output$code <- renderPrint({
    5 * 20
  })
}
shinyApp(ui, server)
