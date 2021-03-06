library(shiny)
library(tidyverse)
library(plotly)

ui <- fluidPage(sidebarLayout(position = "right",
  sidebarPanel(navbarPage(title="Options",
                          tabPanel("Dataset 1",
                                   checkboxInput("graph1",h4("Click here to add a first dataset to your graph")),
                                   checkboxInput("meanln1",h6("Display Mean")),
                                   checkboxInput("trendln1",h6("Display Trendline")),
                                   h6("Please keep parameters the same when comparing multiple datasets"),
                                   selectInput("parameters", h3("Parameters"),
                                               choices = list("Avg Temperature"="tavg","Max Temperature"="tmax","Min Temperature"="tmin",
                                                              "Precipitation"="pcp","Cooling Degree Days"="cdd","Heating Degree Days"="hdd",
                                                              "Palmer Drought Severity Index"="pdsi","Palmer Hydrological Drought Index"="phdi",
                                                              "Palmer Modified Drought Index"="pmdi","Palmer Z-Index"="zndx")),
                                   selectInput("scale", h3("Time Scale"),
                                               choices = list("1-Month"=1,"2-Month"=2,"3-Month"=3,"4-Month"=4,"5-Month"=5,"6-Month"=6,
                                                              "7-Month"=7,"8-Month"=8,"9-Month"=9,"10-Month"=10,"11-Month"=11,"12-Month"=12)),
                                   selectInput("month", h3("Month"), 
                                               choices = list("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,"June"=6,
                                                              "July"=7,"August"=8,"September"=9,"October"=10,"November"=11,"December"=12)),
                                   h6("Please choose the last month in a Time Scale (ex. choose December and 12-Month for data for the entire calendar year)"),
                                   sliderInput("years", h3("Years"),
                                               min = 1895,max = 2020,value = c(1980,2010)),
                                   selectInput("state", h3("State"),
                                               choices = list("Alabama"=1,"Alaska"=50,"Arizona"=2,"Arkansas"=3,"California"=4,
                                                              "Colorado"=5,"Connecticut"=6,"Delaware"=7,"Florida"=8,"Georgia"=9,
                                                              "Hawaii"=51,"Idaho"=10,"Illinois"=11,"Indiana"=12,"Iowa"=13,
                                                              "Kansas"=14,"Kentucky"=15,"Louisiana"=16,"Maine"=17,"Maryland"=18,
                                                              "Massachusetts"=19,"Michigan"=20,"Minnesota"=21,"Mississippi"=22,"Missouri"=23,
                                                              "Montana"=24,"Nebraska"=25,"Nevada"=26,"New Hampshire"=27,"New Jersey"=28,
                                                              "New Mexico"=29,"New York"=30,"North Carolina"=31,"North Dakota"=32,"Ohio"=33,
                                                              "Oklahoma"=34,"Oregon"=35,"Pennsylvania"=36,"Rhode Island"=37,"South Carolina"=38,
                                                              "South Dakota"=39,"Tennessee"=40,"Texas"=41,"Utah"=42,"Vermont"=43,
                                                              "Virginia"=44,"Washington"=45,"West Virginia"=46,"Wisconsin"=47,"Wyoming"=48)),
                                   checkboxInput("countybox1",h4("Click here to look at county data")),
                                   uiOutput("county_box1"),
                                   br(),
                                   br()
                                     ),
                          tabPanel("Dataset 2",
                                   checkboxInput("graph2",h4("Click here to add a second dataset to your graph")),
                                   checkboxInput("meanln2",h6("Display Mean")),
                                   checkboxInput("trendln2",h6("Display Trendline")),
                                   h6("Please keep parameters the same when comparing multiple datasets"),
                                   selectInput("parameters2", h3("Parameters"),
                                               choices = list("Avg Temperature"="tavg","Max Temperature"="tmax","Min Temperature"="tmin",
                                                              "Precipitation"="pcp","Cooling Degree Days"="cdd","Heating Degree Days"="hdd",
                                                              "Palmer Drought Severity Index"="pdsi","Palmer Hydrological Drought Index"="phdi",
                                                              "Palmer Modified Drought Index"="pmdi","Palmer Z-Index"="zndx")),
                                   selectInput("scale2", h3("Time Scale"),
                                               choices = list("1-Month"=1,"2-Month"=2,"3-Month"=3,"4-Month"=4,"5-Month"=5,"6-Month"=6,
                                                              "7-Month"=7,"8-Month"=8,"9-Month"=9,"10-Month"=10,"11-Month"=11,"12-Month"=12)),
                                   selectInput("month2", h3("Month"), 
                                               choices = list("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,"June"=6,
                                                              "July"=7,"August"=8,"September"=9,"October"=10,"November"=11,"December"=12)),
                                   h6("Please choose the last month in a Time Scale (ex. choose December and 12-Month for data for the entire calendar year)"),
                                   sliderInput("years2", h3("Years"),
                                               min = 1895,max = 2020,value = c(1980,2010)),
                                   selectInput("state2", h3("State"),
                                               choices = list("Alabama"=1,"Alaska"=50,"Arizona"=2,"Arkansas"=3,"California"=4,
                                                              "Colorado"=5,"Connecticut"=6,"Delaware"=7,"Florida"=8,"Georgia"=9,
                                                              "Hawaii"=51,"Idaho"=10,"Illinois"=11,"Indiana"=12,"Iowa"=13,
                                                              "Kansas"=14,"Kentucky"=15,"Louisiana"=16,"Maine"=17,"Maryland"=18,
                                                              "Massachusetts"=19,"Michigan"=20,"Minnesota"=21,"Mississippi"=22,"Missouri"=23,
                                                              "Montana"=24,"Nebraska"=25,"Nevada"=26,"New Hampshire"=27,"New Jersey"=28,
                                                              "New Mexico"=29,"New York"=30,"North Carolina"=31,"North Dakota"=32,"Ohio"=33,
                                                              "Oklahoma"=34,"Oregon"=35,"Pennsylvania"=36,"Rhode Island"=37,"South Carolina"=38,
                                                              "South Dakota"=39,"Tennessee"=40,"Texas"=41,"Utah"=42,"Vermont"=43,
                                                              "Virginia"=44,"Washington"=45,"West Virginia"=46,"Wisconsin"=47,"Wyoming"=48)),
                                   checkboxInput("countybox2",h4("Click here to look at county data")),
                                   uiOutput("county_box2"),
                                   br(),
                                   br()
                          ),
                          tabPanel("Dataset 3",
                                   checkboxInput("graph3",h4("Click here to add a third dataset to your graph")),
                                   checkboxInput("meanln3",h6("Display Mean")),
                                   checkboxInput("trendln3",h6("Display Trendline")),
                                   h6("Please keep parameters the same when comparing multiple datasets"),
                                   selectInput("parameters3", h3("Parameters"),
                                               choices = list("Avg Temperature"="tavg","Max Temperature"="tmax","Min Temperature"="tmin",
                                                              "Precipitation"="pcp","Cooling Degree Days"="cdd","Heating Degree Days"="hdd",
                                                              "Palmer Drought Severity Index"="pdsi","Palmer Hydrological Drought Index"="phdi",
                                                              "Palmer Modified Drought Index"="pmdi","Palmer Z-Index"="zndx")),
                                   selectInput("scale3", h3("Time Scale"),
                                               choices = list("1-Month"=1,"2-Month"=2,"3-Month"=3,"4-Month"=4,"5-Month"=5,"6-Month"=6,
                                                              "7-Month"=7,"8-Month"=8,"9-Month"=9,"10-Month"=10,"11-Month"=11,"12-Month"=12)),
                                   selectInput("month3", h3("Month"), 
                                               choices = list("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,"June"=6,
                                                              "July"=7,"August"=8,"September"=9,"October"=10,"November"=11,"December"=12)),
                                   h6("Please choose the last month in a Time Scale (ex. choose December and 12-Month for data for the entire calendar year)"),
                                   sliderInput("years3", h3("Years"),
                                               min = 1895,max = 2020,value = c(1980,2010)),
                                   selectInput("state3", h3("State"),
                                               choices = list("Alabama"=1,"Alaska"=50,"Arizona"=2,"Arkansas"=3,"California"=4,
                                                              "Colorado"=5,"Connecticut"=6,"Delaware"=7,"Florida"=8,"Georgia"=9,
                                                              "Hawaii"=51,"Idaho"=10,"Illinois"=11,"Indiana"=12,"Iowa"=13,
                                                              "Kansas"=14,"Kentucky"=15,"Louisiana"=16,"Maine"=17,"Maryland"=18,
                                                              "Massachusetts"=19,"Michigan"=20,"Minnesota"=21,"Mississippi"=22,"Missouri"=23,
                                                              "Montana"=24,"Nebraska"=25,"Nevada"=26,"New Hampshire"=27,"New Jersey"=28,
                                                              "New Mexico"=29,"New York"=30,"North Carolina"=31,"North Dakota"=32,"Ohio"=33,
                                                              "Oklahoma"=34,"Oregon"=35,"Pennsylvania"=36,"Rhode Island"=37,"South Carolina"=38,
                                                              "South Dakota"=39,"Tennessee"=40,"Texas"=41,"Utah"=42,"Vermont"=43,
                                                              "Virginia"=44,"Washington"=45,"West Virginia"=46,"Wisconsin"=47,"Wyoming"=48)),
                                   checkboxInput("countybox3",h4("Click here to look at county data")),
                                   uiOutput("county_box3"),
                                   br(),
                                   br()
                          )
              )),
  
  mainPanel(navbarPage(title = "Climate at a Glance",
                       tabPanel("Home",
                                textOutput("county_ex"),
                                textOutput("cnty_code"),
                                textOutput("state_num"),
                                textOutput("st_abv"),
                                textOutput("county_url"),
                                textOutput("state_url"),
                                h1("Carleton Climate at a Glance"),
                                h6("Welcome to Carleton Climate at a Glance. This Shiny app was created in response to the slow loading time of the website
                                   NOAA Climate at a Glance. Although this app does not have all the capabilities of the original website, it contains additional
                                   options such as density graphs and overlaying graphs."),
                                a(href="https://www.ncdc.noaa.gov/cag/", "Click here to go to the original NOAA website!"),
                                hr(),
                                h3("Parameter Definitions"),
                                h4("Avg Temperature"), p("Mean Temperature (°F) of a specified area over a specified time interval"),
                                h4("Max Temperature"), p("Hottest Temperature (°F) recorded in a specified area over a specified time interval"),
                                h4("Min Temperature"), p("Coldest Temperature (°F) recorded in a specified area over a specified time interval"),
                                h4("Precipitation"), p("Total Precipitation (inches) in a specified area over a specified time interval"),
                                h4("Cooling Degree Days"), p("A cooling degree day (CDD) is a measurement designed to quantify the demand for energy needed to cool buildings. 
                                                             It is the number of degrees that a day's average temperature is above 65°F"),
                                h4("Heating Degree Days"), p("A heating degree day (HDD) is a measurement designed to quantify the demand for energy needed to heat a building. 
                                                             It is the number of degrees that a day's average temperature is below 65°F"),
                                h4("Palmer Drought Severity Index"), p("The Palmer Drought Severity Index (PDSI) is a measurement of dryness based on recent precipitation and temperature.
                                                                       Dry conditions are represented by negative values while wet conditions are represented by positive values."),
                                h4("Palmer Hydrological Drought Index"), p("The Palmer Hydrological Drought Index (PHDI) measures hydrological impacts of drought."),
                                h4("Palmer Modified Drought Index"), p("The Palmer Modified Drought Index (PMDI) is a modified verison of the PDSI created by Heddinghaus and Sabol (1991)."),
                                h4("Palmer Z-Index"), p("The Palmer Z-Index measures short-term drought on a montly scale"),
                                h4("Please note that the Palmer Indices are not available for all locations (ex. Alaska)"),
                                a(href="https://www.ncdc.noaa.gov/temp-and-precip/drought/historical-palmers/overview", "Click here to go to learn more about the Palmer Indices!")
                                ),
                       tabPanel("Time Series",
                                mainPanel(
                                  fluidRow(
                                    uiOutput("ts_error_message")
                                  ),
                                  fluidRow(
                                    uiOutput("ts_refresh")
                                  ),
                                  fluidRow(
                                    column(12, plotlyOutput("my_tsplot"))
                                  ),
                                  br(),
                                  fluidRow(
                                    uiOutput("my_legend1ts"),
                                    uiOutput("my_legend2ts"),
                                    uiOutput("my_legend3ts")
                                  ))),
                       tabPanel("Distribution Plots", 
                                mainPanel(
                                  fluidRow(
                                    uiOutput("ds_error_message")
                                  ),
                                  fluidRow(
                                    uiOutput("ds_refresh")
                                  ),
                                  fluidRow(
                                    column(12, plotlyOutput("my_dsplot"))
                                  ),
                                  br(),
                                  fluidRow(
                                    uiOutput("my_legend1ds"),
                                    uiOutput("my_legend2ds"),
                                    uiOutput("my_legend3ds")
                                  ))),
                       tabPanel("Resources",
                                mainPanel(
                                  h3("Questions?"),
                                  h6("Please email Dan Maxbauer (dmaxbauer@carleton.edu) or Jaren Yambing (yambingj@carleton.edu) with any questions or issues you come across. Enjoy!"),
                                  h3("Useful Links!"),
                                  a(href="https://www.ncdc.noaa.gov/cag/", "NOAA Climate at a Glance"),
                                  br(),
                                  a(href="https://github.com/jaren-yambing/NOAA-Shiny-App","GitHub Repository of the App Code")
                                ))
              ))
))
