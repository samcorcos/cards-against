@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  whiteDeck = createWhiteDeck()
  blackDeck = createBlackDeck()
  players = createPlayers(playerIds)

  GameFactory.dealPlayers(players, whiteDeck)
  GameFactory.dealOne(players, whiteDeck)
  GameFactory.dealTable(blackDeck)

  table = GameFactory.dealTable(blackDeck) # this might have an error... Perhaps we need to run GameFactory....

  blackDeck: blackDeck
  whiteDeck: whiteDeck
  players: players
  table: table
  currentTurn: playerIds
  inProgress: true
  started: new Date()
  submittedCards: []

  # would be helpful if this could return the id so we could redirect to the game page after game has been started




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
  cards = Cards.find(cardType: "Q", numAnswers: 1).fetch() # Currently only creates a deck with one answer
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
