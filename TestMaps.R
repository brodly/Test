#load necessary libraries
library(leaflet)
library(dplyr)
library(htmltools)

#read data
setwd("~/Downloads")
vaccination_sites <- read.csv("vaccine_data.csv")

#check out data structure
str(vaccination_sites)

#create map with markers assigned to geolocation
vaccination_map <- leaflet(data = vaccination_sites) %>%
  addTiles() %>%
  addMarkers(~longitude, ~latitude, label = ~as.character(site_name))

vaccination_map

#add labels to each marker
vaccination_map2 <- leaflet(data = vaccination_sites) %>%
  addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~site_name) %>% 
  addMarkers(
    lng = -78.8657458466263, lat = 42.8908283062944,
    label = "A",
    labelOptions = labelOptions(noHide = T, 
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8058372046792, lat = 42.9163063173677,
    label = "B",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.894598075844, lat = 42.9181022118472,
    label = "C",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8373975390524, lat = 42.9021879659841,
    label = "D",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8395632181734, lat = 42.92487262604,
    label = "E",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8536375893389, lat = 42.9149041774558,
    label = "F",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.7633546200198, lat = 42.9136871350806,
    label = "G",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8366387335159, lat = 42.8933244760524,
    label = "H",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8484831046772, lat = 42.9475006368521,
    label = "I",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8589502200194, lat = 42.9197687371048,
    label = "J",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8645698353606, lat = 42.9085892700769,
    label = "K",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px")))

vaccination_map2

#Create legend data for a legend 
legend_data <- data.frame(
  label = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"),
  location = c("Pilgrim Baptist Church", "New Hope Baptist Church", "JRCHC (Barton St.)", "Dr. Charles Drew P.S. 59", "Fillmore Super Flea Market", "Dexter Pharmacy", "Galleria Mall", "JRCHC (Broadway)", "Prevention Council of Erie County", "Lincoln Memorial Church", "Igniting Hope Conference 2023")
)

#Create legend html that will be added to the code using the addControl function to add the legend to the map
legend_html <- tags$div(class = "location-list",
                        tags$table(
                          tags$thead(
                            tags$tr(
                              tags$th(""),
                              tags$th("Location/Event", style = "text-align: left;")
                            )
                          ),
                          tags$tbody(class = "location-list-body",
                                     lapply(seq_len(nrow(legend_data)), function(i) {
                                       tags$tr(
                                         tags$td(legend_data$label[i]),
                                         tags$td(legend_data$location[i])
                                       )
                                     })
                          )
                        )
)

leafletOptions <- leafletOptions(
  cssDefinition = tags$style(".location-list-body td { text-align: center; }")
)

#Create vaccination map with legend and title
vaccination_map3 <- leaflet(data = vaccination_sites) %>%
  addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~site_name) %>% 
  addMarkers(
    lng = -78.8657458466263, lat = 42.8908283062944,
    label = "A",
    labelOptions = labelOptions(noHide = T, 
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8058372046792, lat = 42.9163063173677,
    label = "B",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.894598075844, lat = 42.9181022118472,
    label = "C",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8373975390524, lat = 42.9021879659841,
    label = "D",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8395632181734, lat = 42.92487262604,
    label = "E",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8536375893389, lat = 42.9149041774558,
    label = "F",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.7633546200198, lat = 42.9136871350806,
    label = "G",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8366387335159, lat = 42.8933244760524,
    label = "H",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>%
  addMarkers(
    lng = -78.8484831046772, lat = 42.9475006368521,
    label = "I",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8589502200194, lat = 42.9197687371048,
    label = "J",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addMarkers(
    lng = -78.8645698353606, lat = 42.9085892700769,
    label = "K",
    labelOptions = labelOptions(noHide = T,
                                style = list("border-color" = "rgba(0,0,0,0.5)",
                                             "font-size" = "12px"))) %>% 
  addControl(legend_html, position = "bottomright") %>% #add legend
  addControl(
    tags$h2("REACH Buffalo COVID/Flu Pop-Up Vaccination Sites 2022/23"),
    position = "topleft"
  )


vaccination_map3
