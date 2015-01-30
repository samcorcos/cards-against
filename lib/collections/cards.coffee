@Cards = new Mongo.Collection 'cards'

if Meteor.isServer
  Meteor.publish 'cards', ->
    Cards.find()

  Cards.deny
    insert: ->
      true
    update: ->
      true
    remove: ->
      true

if Meteor.isClient
  Meteor.subscribe 'cards'
