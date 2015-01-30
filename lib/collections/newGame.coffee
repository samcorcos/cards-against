@NewGames = new Mongo.Collection 'newGames'

if Meteor.isServer
  Meteor.publish 'newGames', ->
    NewGames.find()


if Meteor.isClient
  Meteor.subscribe 'newGames'
