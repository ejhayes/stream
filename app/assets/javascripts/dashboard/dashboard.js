$(document).ready(function() {

  $('#tweet_form').submit(function(){
    $.ajax({
        type: "POST",
        //the url where you want to sent the userName and password to
        url: '/dashboard/tweet',
        dataType: 'json',
        async: true,
        //json object to sent to the authentication url
        data: { message: $('#message').val() },
        success: function () {
          alert("Thanks!"); 
        },
        error: function(e) {
          debugger;
        }
    });

    return false;
  });

});