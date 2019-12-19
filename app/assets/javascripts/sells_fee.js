$(function() {
  $("#sells__price").on("input", function(e) {
    e.preventDefault()
    let input = $("#sells__price").val();
    if ((input >= 300 ) && (input <= 9999999 )) {
      let fee = Math.floor(input*0.1);
      let profit = (input - fee);
      $(".sells__right1").html(fee);
      $(".sells__right1").prepend("¥");
      $(".sells__right2").html(profit);
      $(".sells__right2").prepend("¥");
      $("#price").val(input);
    }
    else if (input <= 300 || input >= 9999999){
      $(".sells__right1").html("-");
      $(".sells__right2").html("-");
    }
    else if (input == "") {
        $(".sells__right1").html("-");
        $(".sells__right2").html("-");
    }
  });

});