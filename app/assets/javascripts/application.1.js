// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require cable



/*function scrollToBottom() {
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}
*/
function scrollToBottomChat() {
  if ($('#ChefChats').length > 0) {
    $('#ChefChats').scrollTop($('#ChefChats')[0].scrollHeight);
  }
}

function submitMessage(event) {
  event.preventDefault();
  $('#new_message').submit();
  //$('form#ChefChats').submit();
};

$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode == 13) {
    submitMessage(event);
  }
});

/*
$(document).on('click', '[data-send~=message]', function(event) {
  submitMessage(event);
});

*/

$(document).ready(function() {
  scrollToBottomChat();
});



$(document).on('ajax:success', function() {
  $("#new_message").on("ajax:complete", function(e, data, status, xhr) {
    //$("#new_message").on("ajax:complete", function(e, data, status) {
    //    $('#message_content').val('').click();
    $('#message_content').val('');
  });
  scrollToBottomChat();
});



/*
$(document).ready(function() {
  $("#new_message").on("ajax:complete", function(e, data, status) {
    $('.message .content').val('');
  });
  scrollToBottomChat();
});

$(document).on('turbolinks:load', function() {
  $("#new_message").on("ajax:complete", function(e, data, status) {
    $('#message_content').val('');
  });
  scrollToBottom();
});


$(document).ready ->
  $("#new_article").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"


*/
