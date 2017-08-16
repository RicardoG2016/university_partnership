function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')          
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
    return "<div id='other'><p> <b>" + data.group + ": </b><p>" + data.message + "</p></div>";
  },
      });
return App.messages;
}