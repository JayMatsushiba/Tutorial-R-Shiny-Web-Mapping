library(shiny)
library(sf)
library(leaflet)

black_bear_obs <- st_read("../data/black_bear_observations_bc/black_bear_observations_bc.shp")

ui <- fluidPage(
  leafletOutput(outputId = "mymap")
)
server <- function(input, output, session) {
  output$mymap <- renderLeaflet({
    leaflet() %>%
      # This is how we add a basemap on the leaflet
      addProviderTiles(provider = providers$CartoDB.Positron)
  })
}
shinyApp(ui, server)
