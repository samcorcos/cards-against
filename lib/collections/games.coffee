@Games = new Mongo.Collection 'games'

if Meteor.isServer
  Meteor.publish 'games', ->
    Games.find()

if Meteor.isClient
  Meteor.subscribe 'games'
