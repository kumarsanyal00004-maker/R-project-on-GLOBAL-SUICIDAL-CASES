library(shiny)

ui <- fluidPage(
  titlePanel("Suicide Rate Explorer"),
  selectInput("country", "Choose a Country", unique(suicide_data$country)),
  plotOutput("trendPlot")
)

server <- function(input, output) {
  output$trendPlot <- renderPlot({
    data <- suicide_data %>% filter(country == input$country)
    ggplot(data, aes(x=year, y=suicides_per_100k)) +
      geom_line(color="purple") +
      labs(title=paste("Suicide Rate in", input$country))
  })
}

shinyApp(ui = ui, server = server)



