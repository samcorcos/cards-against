@Games = new Mongo.Collection 'games'

if Meteor.isServer
  Meteor.publish 'games', ->
    Games.find
      players:
        $exists: @userId


if Meteor.isClient
  Meteor.subscribe 'games'



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
