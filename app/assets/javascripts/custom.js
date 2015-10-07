$(document).on('ready page:load', function () {
  $(".list-tags").select2({
    theme: "bootstrap",
    tags: true,
    createTag: function (params) {
      return {
        id: params.term,
        text: params.term,
        newOption: true
      }
    },
    templateResult: function (data) {
      var $result = $("<span></span>");

      $result.text(data.text);

      if (data.newOption) {
        $result.append(" <em>(new)</em>");
      }

      return $result;
    },
    id: function(object) {
      return object.text;
    }
  });
});