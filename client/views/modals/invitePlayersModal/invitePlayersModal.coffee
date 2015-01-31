Template.invitePlayersModal.rendered = ->


Template.invitePlayersModal.events {}

Template.invitePlayersModal.helpers
  allPlayers: ->
    Meteor.users.find _id:
      $ne: Meteor.user()._id

  currentGame: ->
    true



Template._playerItem.helpers
  invited: ->


  accepted: ->


  available: ->
    true

Template._playerItem.events
  'click button': (e,t) ->
    lobby = Session.get "currentLobby"
    Meteor.call "sendNotification", @_id, lobby, Meteor.user().username
    # make a server call to send that user a notification with a link to the lobby ID
    # if that person clicks "accept", the lobby item adds them to the players list
    # they also route to the lobby
    # should probably make it so the lobby can only be edited by people who are in the "invited" array
