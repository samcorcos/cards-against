Template.currentLobby.rendered = ->
  @autorun ->
    data = Template.currentData()
    if data.url
      Router.go data.url


Template.currentLobby.events
  'click #invite-players': (e,t) ->
    Session.set "currentLobby", @_id
    IonModal.open 'invitePlayersModal'

  'click #start-game': (e,t) ->
    playerIds = [@host]
    lobbyId = Template.currentData()._id

    @players.forEach (player) ->
      playerIds.push(player.id)

    Meteor.call 'createGame', playerIds, (err, res) ->
      Lobby.update
        _id: lobbyId
      ,
        $set:
          url: "/game/#{res}"

    # Router.go('home') # this does not redirect everyone, just host... Need to fix...
    # Then, delete the lobby, and redirect to the game page

Template.currentLobby.helpers
  hostname: ->
    data = Template.currentData()
    Meteor.users.findOne
      _id: data.host
  allPlayers: ->
    data = Template.currentData()
    Lobby.findOne(_id: data._id).players


###

Get set the url for the lobby
when the url property changes, use autorun to route everyone to the lobby url (to the game)

###
