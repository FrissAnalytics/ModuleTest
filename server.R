shinyServer(function(input, output, session){

  observe({

    # module server
    callModule(module = dimModule, id = "id1",
               data   = reactive( list(id = "id1", dim = input$"dim") )
    )
  })

  # main observe block 1
  observeEvent(input$"dim", {
    cat("\nmain observe 1: message")
  })

  # main observe block 2
  observeEvent(input$"id1-dim", {
    cat("\nmain observe 2: message")
  })

})
