$(
  ->
    if window.location.pathname.match(/\/rooms\/\d+$/)
      $room_id = $("#room_id").val()
      App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $room_id },
        connected: ->
          # Called when the subscription is ready for use on the server

        disconnected: ->
          # Called when the subscription has been terminated by the server

        received: (data) ->
          $('#messages').append data['message']

        speak: (message) ->
          @perform 'speak', message: message

      $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
        if event.keyCode is 13 # send
          App.room.speak event.target.value
          event.target.value = ''
          event.preventDefault()
)
