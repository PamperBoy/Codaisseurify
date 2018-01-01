function createSong(name) {
  var newSong = { name: name };
  var pathname = window.location.pathname + "/songs.json";

  $.ajax({
    type: "POST",
    url: pathname,
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {

    var songName = $('<td></td>')
      .html(name);

    var tableRow = $('<tr></td>')
      .append(songName);

    $("#artistSongs").append( tableRow );
  })
  .fail(function(error) {
    error_message = error.responseJSON.name[0];
    showError(error_message);
  });
}

function showError(message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(message);

  $("#formgroup-title")
    .addClass("has-error")
    .append(errorHelpBlock);
}

function resetErrors() {
  $("#error_message").remove();
  $("#formgroup-title").removeClass("has-error");
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

$(document).ready(function() {
  $("#new_song").bind('submit', submitSong);
});
