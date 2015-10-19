$(document).on('ready page:load', function () {
  var scheme   = "ws://";
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  ws.onmessage = function(message) {
    var data = JSON.parse(message.data);
    $("#comment_container").prepend("<div class='well'>" +
                                     "<h4>" + data.author_name + "<small> " + data.author_email + "</small></h4>" +
                                     "<p>"+ data.text + "</p>" +
                                   "</div>"
                                   );
    $("#comment_container").stop().animate({
      scrollTop: $('#comment_container')[0].scrollHeight
    }, 800);
  };


  $("#new_comment").on("submit", function(event) {
    var text   = $("#comment_content")[0].value;
    var author_name = "Anonymous"
    var author_email = "anonymous@dot.com"
    ws.send(JSON.stringify({ text: text, author_name: author_name , author_email: author_email }));
  });

  window.onbeforeunload = function() {
      websocket.onclose = function () {}; // disable onclose handler first
      websocket.close()
  };

});