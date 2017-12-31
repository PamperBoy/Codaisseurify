function createSong(name) {

}

function submitSong(event) {
  event.preventDefault();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

$(document).ready(function() {
  $("form").bind('submit', submitSong);
});
