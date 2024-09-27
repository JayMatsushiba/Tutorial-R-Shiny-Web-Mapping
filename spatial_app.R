library(shiny)
library(bslib)
library(sf)
library(leaflet)

black_bear_obs <- st_read("data/black_bear_observations_bc/black_bear_observations_bc.shp")

# Define UI ----
ui <- page_sidebar(
  title = "Black Bear Observations Web Map",
  sidebar = sidebar("Filter by Date",
                    dateRangeInput(inputId = "date_range",
                                   label = "Date Range"),
                    actionButton(inputId = "filter_action",
                                 label = "Filter"),
                    # Adding some simple text outputs
                    textOutput(outputId = "text_start_date"),
                    textOutput(outputId = "text_end_date")
  ),
  leafletOutput(outputId = "mymap")
)

# Define server logic ----
server <- function(input, output) {
  start_date <- eventReactive(input$filter_action, {
    input$date_range[1]
  })
  end_date <- eventReactive(input$filter_action, {
    input$date_range[2]
  })
  output$text_start_date <- renderText({
    paste0("Start date: ", start_date())
  })
  output$text_end_date <- renderText({
    paste0("End date: ",  end_date())
  })

  selected_black_bear_obs <- reactive({
    black_bear_obs[black_bear_obs$observed_1 >= start_date() & black_bear_obs$observed_1 <= end_date(),]
  })

  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(provider = providers$CartoDB.Positron) %>%
      addCircles(data = selected_black_bear_obs(),
                 popup = ~observed_1)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
