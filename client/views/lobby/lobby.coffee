Template.lobby.rendered = ->


Template.lobby.events
  'click button#host-lobby': (e,t) ->
    lobbyId = Lobby.insert
      host: Meteor.user()._id
      status: true
    # this is going to eventually have to make a server call to update the user profile so he can get back to this lobby
    Router.go("currentLobby", _id: lobbyId)

    IonModal.open("invitePlayersModal")

Template.lobby.helpers
  allPlayers: ->

  currentGame: ->
    false
