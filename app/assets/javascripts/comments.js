$(document).on('ready page:load', function () {
  var scheme   = "ws://";
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  ws.onmessage = function(message) {
    var data = JSON.parse(message.data);
    $("#comment_container").prepend("<div class='well'>" +
                                     "<h4>Anonymous</h4>" +
                                     "<p>"+ data.text + "</p>" +
                                   "</div>"
                                   );
    $("#comment_container").stop().animate({
      scrollTop: $('#comment_container')[0].scrollHeight
    }, 800);
  };


  $("#new_comment").on("submit", function(event) {
    event.preventDefault();
    var text   = $("#comment_content")[0].value;
    ws.send(JSON.stringify({ text: text }));
    $("#comment_content")[0].value = "";
  });

  window.onbeforeunload = function() {
      websocket.onclose = function () {}; // disable onclose handler first
      websocket.close()
  };

});