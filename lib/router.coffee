Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'home',
    path: '/'

  @route 'settings',
    path: '/settings'

  @route 'notifications',
    path: '/notifications'

  @route 'recommendations',
    path: '/recommendations'
