function(input, output, session) {

  output$leafletPlot <- renderLeaflet({
  
  geofile <- paste0("furusato", input$year, ".geojson")  
  
  geo <- st_read(geofile)

  geo <- geo |> filter(!st_is_empty(geo)) # geometryにemptyがあるとleafletで取り扱いできない
  
  col_selected <- vec[input$col_id]
  
  val <- geo[col_selected]  |> st_drop_geometry() |> unlist()
  
  if(col_selected %in% vec_nin){
    char_val <- 
      paste0(format(val, big.mark = ",", scientific = F) |> str_trim(), "人")
  } else if(col_selected %in% vec_ken){
    char_val <- 
      paste0(format(val |> round(2), big.mark = ",", scientific = F) |> str_trim(), "件")
  } else if(col_selected %in% vec_yen){
    char_val <- 
      paste0(format(val |> round(2), big.mark = ",", scientific = F) |> str_trim(), "円")
  } else if(col_selected == "pop_change_rate"){
    char_val <- 
      paste0(val |> round(3), "%")
  } else if(col_selected == "household"){
    char_val <- 
      paste0(format(val, big.mark = ",", scientific = F) |> str_trim(), "軒")
  }
  
  bins <- quantile(val |> na.omit(), probs=seq(0, 1, by=0.1)) |> round(3)
  pal <- colorBin("Spectral", domain = val, bins = bins, reverse=TRUE)
  
  geo |> 
    leaflet() |> 
    addProviderTiles(providers$OpenStreetMap) |> 
    setView(137.5, 37.5, zoom = 6) |> 
    addPolygons(
      fillColor = ~pal(val),
      weight = 1,
      opacity = 1,
      color = "white",
      dashArray = "3",
      fillOpacity = 0.5,
      highlightOptions = highlightOptions(
        weight = 5,
        color = "#666",
        dashArray = "",
        fillOpacity = 0.3,
        bringToFront = TRUE),
      label = map2_chr(geo$city, char_val, paste),
      labelOptions = labelOptions(
        style = list("font-weight" = "normal", padding = "3px 8px"),
        textsize = "15px",
        direction = "auto")) |> 
    addLegend(pal = pal, values = ~val, opacity = 0.7, title = names(vec)[input$col_id],
              position = "bottomright")
  })
}
