Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'home',
    path: '/'

  @route 'settings',
    path: '/settings'

  @route 'notifications',
    path: '/notifications'
    waitOn: ->
      [
        Meteor.subscribe 'users'
      ]

  @route 'lobby',
    path: '/lobby'

  @route 'currentLobby',
    path: '/lobby/:_id'
    data: ->
      Lobby.findOne(@params._id)
    waitOn: ->
      [
        Meteor.subscribe "lobby"
      ]

  @route 'currentGame',
    path: '/game/:_id'
    data: ->
      Games.findOne(@params._id)
    waitOn: ->
      [
        Meteor.subscribe 'games'
      ]
