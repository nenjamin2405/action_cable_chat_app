App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->

    alert("You have a new mention from @" + data.muser) if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()
      $('#message_content').val("")

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()
  submit_by_button()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('#submitButton').click()
      
      event.preventDefault()
      

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
  