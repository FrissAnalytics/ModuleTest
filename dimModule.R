# module ui
dimModuleUI <- function(id){

  ns <- NS(id)

  tagList(

    includeScript("www/screenDimensions.js"),

    h3("window dimensions:"),

    fluidRow(
      column(4,h4("method 1"),verbatimTextOutput(ns("dimInfo1"))),
      column(4,h4("method 2"),verbatimTextOutput(ns("dimInfo2"))),
      column(4,h4("method 3"),verbatimTextOutput(ns("dimInfo3")))
    )
  )

}

# module server
dimModule <- function(input, output, session, data){

  ns <- session$ns

  session$sendCustomMessage("getDimensions",list(id = data()$id))

  # dimension info 1
  output$dimInfo1 = renderPrint({

    if(is.null(data()$"dim")) return()

    data()$"dim"

  })

  # dimension info 2
  output$dimInfo2 = renderPrint({
    input$dim
  })

  # dimension info 3
  output$dimInfo3 = renderPrint({
    input$"id1-dim"
  })

  # module observe block 1
  observeEvent(input$"dim", {
    cat("\nmodule observe 1: message")
  })

  # module observe block 2
  observeEvent(input$"id1-dim", {
    cat("\nmodule observe 2: message")
  })
}
