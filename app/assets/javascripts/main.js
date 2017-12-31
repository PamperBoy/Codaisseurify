function createSong(name) {

  var songName = $('<td></td>')
    .html(name);

  var tableRow = $('<tr></td>')
    .append(songName);

  $("#artistSongs").append( tableRow );


}

function submitSong(event) {
  event.preventDefault();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

$(document).ready(function() {
  $("#new_song").bind('submit', submitSong);
});
