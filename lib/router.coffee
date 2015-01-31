Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'home',
    path: '/'

  @route 'settings',
    path: '/settings'

  @route 'notifications',
    path: '/notifications'

  @route 'lobby',
    path: '/lobby'

  @route 'currentLobby',
    path: '/lobby/:_id'
    data: ->
      Lobby.findOne(@params._id)
    controller: 'CurrentLobbyController'
