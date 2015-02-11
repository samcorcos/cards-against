Template.invitePlayersModal.helpers
  allPlayers: ->
    Meteor.users.find _id:
      $ne: Meteor.user()._id

Template._playerItem.helpers
  invited: ->
    lobbyId = Session.get "currentLobby"
    userId = @_id
    status = false
    Lobby.findOne(lobbyId).invitedPlayers.forEach (playerId) ->
      status = if playerId is userId then true else false
    status
    false # TODO This is not working... It changes the helper for all other templates as well

  available: ->
    lobbyId = Session.get "currentLobby"
    userId = @_id
    status = true
    Lobby.findOne(lobbyId).invitedPlayers.forEach (playerId) ->
      status = if playerId is userId then false else true
    status
    true # TODO this is not working... It's changing the helper for all other templates as well

Template._playerItem.events
  'click button': (e,t) ->
    lobbyId = Session.get "currentLobby"
    Meteor.call "sendNotification", @_id, lobbyId, Meteor.user().username
    Lobby.update
      _id: lobbyId
    ,
      $addToSet:
        invitedPlayers: @_id
