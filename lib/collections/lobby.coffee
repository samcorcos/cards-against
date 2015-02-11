@Lobby = new Mongo.Collection 'lobby'

if Meteor.isServer
  Meteor.publish 'lobby', ->
    Lobby.find()

  Lobby.allow
    insert: ->
      true
    update: ->
      true

if Meteor.isClient
  Meteor.subscribe 'lobby'
