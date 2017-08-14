$(document).ready(function() {
  $('form#new_message.new_message').keydown(function(e) {
    if (e.keyCode == 13) {
      console.log('13')
      console.log(this)
      e.preventDefault(); // prevent another \n from being entered
      this.submit();
      $('textarea#message_content').val('');
    }
  });

});