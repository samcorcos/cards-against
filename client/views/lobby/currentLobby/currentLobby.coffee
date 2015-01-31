Template.currentLobby.rendered = ->
  console.log this

Template.currentLobby.events
  'click #invite-players': (e,t) ->
    Session.set "currentLobby", @_id
    IonModal.open 'invitePlayersModal'

  'click #start-game': (e,t) ->
    playerIds = [@host]
    @players.forEach (player) ->
      playerIds.push(player.id)
    Meteor.call 'createGame', playerIds
    # Then, delete the lobby, and redirect to the game page

Template.currentLobby.helpers
  hostname: ->
    Meteor.users.findOne
      _id: @host
  allPlayers: ->
    Lobby.findOne(_id: @_id).players
