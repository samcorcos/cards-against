Template.lobby.events
  'click button#host-lobby': (e,t) ->
    lobbyId = Lobby.insert
      host: Meteor.user()._id
      hostName: Meteor.user().username
      status: true
      players: []
      invitedPlayers: []
      url: false
    Router.go("currentLobby", _id: lobbyId)
