#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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


ui <- fluidPage(
        
        titlePanel("Life expectancy at birth by country and sex in 2025"),
        
        sidebarLayout(
                sidebarPanel(
                        selectInput("region",
                                    "Select region to plot:",
                                    choices = sort(unique(countrycode_data$region)),
                                    selected = 'Northern Africa')
                ),
                
                mainPanel(
                        plotlyOutput("dumbbell")
                )
        )
)