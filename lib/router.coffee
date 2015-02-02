Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'home',
    path: '/'

  @route 'settings',
    path: '/settings'

  @route 'notifications',
    path: '/notifications'
    controller: 'NotificationsController'

  @route 'lobby',
    path: '/lobby'

  @route 'currentLobby',
    path: '/lobby/:_id'
    data: ->
      Lobby.findOne(@params._id)
    controller: 'CurrentLobbyController'

  @route 'currentGame',
    path: '/game/:_id'
    controller: "GamesController"
    data: ->
      game = Games.findOne(@params._id)
      # console.log Games.findOne(@params._id)
      # game.player = $.grep(game.players, (o) -> o.playerId is Meteor.user()._id) # game.players[Meteor.user()._id]                 # Will make it easier to select a user in a template
      # game.yourTurn = game.currentTurn[0] == Meteor.user()._id    # Will return "true" if your turn, or false if someone else's turn
      game
