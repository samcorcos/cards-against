@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  whiteDeck = createWhiteDeck()
  blackDeck = createBlackDeck()
  players = createPlayers(playerIds)
  table = GameFactory.dealTable(blackDeck)

  GameFactory.dealPlayers(players, whiteDeck)
  GameFactory.dealOne(players, whiteDeck)
  GameFactory.dealTable(blackDeck)

  blackDeck: blackDeck
  whiteDeck: whiteDeck
  players: players
  table: table
  currentTurn: playerIds
  inProgress: true
  started: new Date()
  submittedCards: []

GameFactory.dealPlayers = (players, whiteDeck) -> # deals each player 10 cards
  for i in [0...10]
    Object.keys(players).forEach (player) ->
      players[player].hand.push(whiteDeck.shift()) # gives the player the card from the top of the deck and mutates the deck

GameFactory.dealOne = (players, whiteDeck) ->
  Object.keys(players).forEach (player) ->
    players[player].hand.push(whiteDeck.shift()) if players[player].hand.length < 10

GameFactory.dealTable = (blackDeck) ->
  blackDeck.shift() # this will give us the black card, but it isn't assigned to any players


createWhiteDeck = ->
  cards = Cards.find(cardType: "A").fetch()
  _.shuffle(cards)

createBlackDeck = ->
  cards = Cards.find(cardType: "Q", numAnswers: 1).fetch() # TODO Currently only creates a deck with one answer; game wont work with two answers
  _.shuffle(cards)

createPlayers = (players) ->
  o = {}
  players.forEach (player) ->
    o[player] =
      playerName: Meteor.users.findOne( player ).username
      hand: []
      score: 0
    return
  o
