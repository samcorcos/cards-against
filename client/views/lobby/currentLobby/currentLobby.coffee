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

Template.currentLobby.helpers
  hostname: ->
    data = Template.currentData()
    Meteor.users.findOne
      _id: data.host
  allPlayers: ->
    data = Template.currentData()
    Lobby.findOne(_id: data._id).players
  isHost: ->
    data = Template.currentData()
    if Meteor.user()._id is data.host then true else false
