// getDimensions
Shiny.addCustomMessageHandler('getDimensions', function(data){

  // window dimensions prior to window resize
  var dimInfo = { height: $(window).height(), width : $(window).width() , id: data.id};

  // message 1 A
  console.log("message 1 A");
  Shiny.onInputChange("dim", dimInfo);

  // message 2 A
  console.log("message 2 A");
  console.log(data.id + "-dim");
  Shiny.onInputChange(data.id + "-dim", dimInfo);

  // window dimensions after window resize
  $(window).resize(function(){

    // determine windown dimensions
    var dimInfo = { height: $(window).height(), width : $(window).width() , id: data.id};

    // message 1 B
    console.log("message 1 B");
    Shiny.onInputChange("dim", dimInfo);

    // message 2 B
    console.log("message 2 B");
    console.log(data.id + "-dim");
    Shiny.onInputChange(data.id + "-dim", dimInfo);
  });

});