$(document).ready(function() {

  $('#tweet_form').submit(function(){
    $.ajax({
        type: "POST",
        //the url where you want to sent the userName and password to
        url: '/stream/tweet',
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

  var current_page = 1;
  var fetch_tweets = function(page_number) {
    page_number = page_number || 1;
    $('#tweet_loader').show();

    $.ajax({
      url: "/stream/tweets",
      dataType: "json",
      data: {
        page: page_number
      },
      success: function(response) {
        $('#tweet_loader').hide();
        console.log(response);
        $('#tweet_holder').append(response.data.join(''));
        current_page++;

        if(response.has_next) {
          $('#tweet_footer').show();
        } else {
          $('#tweet_footer').hide();
        }
      },
      error: function(error) {
        console.log(error);
        $('#tweet_loader').hide();
      }
    })

  };

  $('#tweet_holder').show();

  fetch_tweets(current_page);

  $('#fetch_more_tweets').click(function(){
    fetch_tweets(current_page);
    return false;
  });
});