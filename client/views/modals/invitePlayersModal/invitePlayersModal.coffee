Template.invitePlayersModal.helpers
  allPlayers: ->
    Meteor.users.find _id:
      $ne: Meteor.user()._id

Template._playerItem.helpers
  invited: ->
    lobbyId = Session.get "currentLobby" # TODO this is not an optimal solution... But it will work.
    userId = @_id
    status = false
    Lobby.findOne(lobbyId).invitedPlayers.forEach (playerId) ->
      status = if playerId is userId then true else false
    status

  available: ->
    lobbyId = Session.get "currentLobby" # TODO this is not an optimal solution... But it will work.
    userId = @_id
    status = true
    Lobby.findOne(lobbyId).invitedPlayers.forEach (playerId) ->
      status = if playerId is userId then false else true
    status


Template._playerItem.events
  'click button': (e,t) ->
    lobbyId = Session.get "currentLobby"
    Meteor.call "sendNotification", @_id, lobbyId, Meteor.user().username
    Lobby.update
      _id: lobbyId
    ,
      $addToSet:
        invitedPlayers: @_id
    # make a server call to send that user a notification with a link to the lobby ID
    # if that person clicks "accept", the lobby item adds them to the players list
    # they also route to the lobby
    # should probably make it so the lobby can only be edited by people who are in the "invited" array
