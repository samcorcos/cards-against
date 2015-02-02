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
    data: ->
      Games.findOne(@params._id)
      # game.player = game.players[Meteor.user()._id]                 # Will make it easier to select a user in a template
      # game.yourTurn = game.currentTurn[0] == Meteor.user()._id    # Will return "true" if your turn, or false if someone else's turn
    controller: "GamesController"
