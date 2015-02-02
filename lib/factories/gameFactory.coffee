@GameFactory = {}

GameFactory.createGame = (playerIds) ->
  whiteDeck = createWhiteDeck()
  blackDeck = createBlackDeck()
  players = createPlayers(playerIds)

  GameFactory.dealPlayers(players, whiteDeck)

  table = dealTable(blackDeck)

  blackDeck: blackDeck
  whiteDeck: whiteDeck
  players: players
  table: table
  currentTurn: playerIds
  inProgress: true
  started: new Date()

  # would be helpful if this could return the id so we could redirect to the game page after game has been started




GameFactory.dealPlayers = (players, whiteDeck) -> # deals each player 10 cards
  for i in [0...10]
    Object.keys(players).forEach (player) ->
      players[player].hand.push(whiteDeck.shift()) # gives the player the card from the top of the deck and mutates the deck

dealTable = (blackDeck) ->
  blackDeck.shift() # this will give us the black card, but it isn't assigned to any players


createWhiteDeck = ->
  cards = Cards.find(cardType: "A").fetch()
  _.shuffle(cards)

createBlackDeck = ->
  cards = Cards.find(cardType: "Q").fetch()
  _.shuffle(cards)

createPlayers = (players) ->
  temp = []
  players.forEach (player) ->
    o = {}
    o.playerId = player
    o.playerName = Meteor.users.findOne(_id: player).username
    o.hand = []
    o.score = 0
    temp.push(o)
  temp
