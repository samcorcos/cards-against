Template.lobby.rendered = ->


Template.lobby.events
  'click button#host-lobby': (e,t) ->
    lobbyId = Lobby.insert
      host: Meteor.user()._id
      hostName: Meteor.user().username
      status: true
    # this is going to eventually have to make a server call to update the user profile so he can get back to this lobby
    Router.go("currentLobby", _id: lobbyId)

    # Session.set "currentLobby", @_id
    # IonModal.open("invitePlayersModal")

Template.lobby.helpers
  allPlayers: ->

  currentGame: ->
    false
