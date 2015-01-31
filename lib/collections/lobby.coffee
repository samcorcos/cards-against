@Lobby = new Mongo.Collection 'lobby'

if Meteor.isServer
  Meteor.publish 'lobby', ->
    Lobby.find()

  Lobby.allow
    insert: (userId, doc) ->
      true

    update: (userId, docs, fields, modifier) ->
      true


if Meteor.isClient
  Meteor.subscribe 'lobby'

###

game =
  currentTurn: []   # an array of users in the game
  whiteDeck: []
  blackDeck: []     # an array of the cards left in the deck
  table: []         # public cards (current black card)
  players: [
    id: id
    hand: []
    score: 0
  ]
  inProgress: true/false
  started: date
  ended: date
  winner: id

###
