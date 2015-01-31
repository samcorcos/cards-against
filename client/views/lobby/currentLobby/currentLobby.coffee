Template.currentLobby.rendered = ->
  console.log this

Template.currentLobby.events
  'click #invite-players': (e,t) ->
    Session.set "currentLobby", @_id
    IonModal.open 'invitePlayersModal'

Template.currentLobby.helpers
  hostname: ->
    Meteor.users.findOne
      _id: @host
  allPlayers: ->
    Lobby.findOne(_id: @_id).players
