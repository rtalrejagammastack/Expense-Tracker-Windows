// app/assets/javascripts/notifications.js
$(document).on('turbolinks:load', function() {
  console.log("Hello")
  setInterval(function() {
    $.ajax({
      url: '/notifications',
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        if (data.unread_count > 0) {
          console.log("sg")
          $('#notifications-count').html(data.unread_count);
          $('#notifications-bell').addClass('has-notifications');
        } else {
          $('#notifications-bell').removeClass('has-notifications');
        }
      }
    });
  }, 5000);

  $('#notifications-bell').on('click',function() {
    $.ajax({
      url: '/notifications',
      method: 'GET',
      dataType: 'html',
      success: function(data) {
        $('#notifications-dropdown').html(data);
        $('#notifications-count').html('0');
        $('#notifications-bell').removeClass('has-notifications');
      }
    });
  });
});