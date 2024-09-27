library(shiny)
library(leaflet)

black_bear_obs <- st_read("../data/black_bear_observations_bc/black_bear_observations_bc.shp")

ui <- fluidPage(
  # We can use leafletOutput like the other outputs
  # Just need to pass a value to outputId
  leafletOutput(outputId = "mymap")
)
server <- function(input, output, session) {
  # Creating the output to mymap, which is our leafletOutput
  output$mymap <- renderLeaflet({
    # We create the leaflet object that will be displayed in the app
    leaflet()
  })
}
shinyApp(ui, server)
