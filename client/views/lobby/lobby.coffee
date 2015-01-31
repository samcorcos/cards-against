Template.lobby.rendered = ->


Template.lobby.events
  'click button#host-lobby': (e,t) ->
    lobbyId = Lobby.insert
      host: Meteor.user()._id
      status: true
    console.log lobbyId
    Router.go("currentLobby", _id: lobbyId)

    IonModal.open("invitePlayersModal")

Template.lobby.helpers
  allPlayers: ->

  currentGame: ->
    false
