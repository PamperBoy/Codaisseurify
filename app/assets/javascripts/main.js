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

    var songId = data.id;

    var songName = $('<td></td>')
      .html(name);

    var deleteButton = $('<a class="btn btn-danger glyphicon glyphicon-trash song-delete"></a>')
    .attr('id', "song-" + songId)

    var deleteSong = $('<td style="text-align: right;"></td>')
    .append(deleteButton)

    var tableRow = $('<tr></td>')
      .attr('data-id', songId)
      .append(songName).append(deleteSong);

    $("#artistSongs").append( tableRow );

    bindClick(songId)

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

  $("#formgroup-song")
    .addClass("has-error")
    .append(errorHelpBlock);
}

function resetErrors() {
  $("#error_message").remove();
  $("#formgroup-song").removeClass("has-error");
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

function deleteSong(event) {
  var currentSongId = this.id.replace("song-", "");
  var pathname = window.location.pathname + "/songs/" + currentSongId;

    $.ajax({
    type: "DELETE",
    url: pathname,
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    $('tr[data-id="' + currentSongId + '"]').remove();
  });
}

function bindClick(id) {
  var songId = "#song-"+ id;
  $(songId).bind('click', deleteSong);
}


$(document).ready(function() {
  $("#new_song").bind('submit', submitSong);
  $("a.song-delete").bind('click', deleteSong);
});
