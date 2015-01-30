@Cards = new Mongo.Collection 'cards'

if Meteor.isServer
  Meteor.publish 'cards', ->
    Cards.find()


if Meteor.isClient
  Meteor.subscribe 'cards'
