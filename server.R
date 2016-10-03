#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(countrycode)
library(plotly)
library(dplyr)
library(tidyr)

source("PopData.R")

server <- function(input, output) {
        
        regiondf <- reactive({
                
                reg <- countrycode_data[countrycode_data$region == input$region, ]
                
                fips <- reg$fips104
                
                sub <- full %>%
                        filter(FIPS %in% fips) %>%
                        rename(Male = E0_M, Female = E0_F) %>%
                        arrange(Female)
                
                sub
                
        })
        
        output$dumbbell <- renderPlotly({
                
                regiondf() %>%
                        gather(Sex, value, Male, Female) %>%
                        plot_ly(x = value, y = NAME, mode = 'lines',
                                group = NAME, showlegend = FALSE, line = list(color = 'gray'),
                                hovermode = FALSE, hoverinfo = 'none') %>%
                        add_trace(x = value, y = NAME, color = Sex, mode = 'markers',
                                  colors = c('darkred', 'navy'), marker = list(size = 10)) %>%
                        layout(xaxis = list(title = 'Life expectancy at birth'),
                               yaxis = list(title = ''),
                               margin = list(l = 120))
                
        })
        
}

