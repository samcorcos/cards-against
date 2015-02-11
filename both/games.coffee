Meteor.methods
  createGame: (playerIds) ->
    game = GameFactory.createGame(playerIds)
    Games.insert game

  submitCard: (gameId, playerId, card) ->
    game = Games.findOne(_id: gameId)

    subCards = game.submittedCards
    subCards.push
      card: card
      player: playerId
    game.submittedCards = _.uniq(subCards)

    hand = game.players[playerId].hand
    newHand = _.without(hand, _.findWhere(hand, _id: card._id))
    game.players[playerId].hand = newHand

    Games.update
      _id: gameId
    ,
      game

  selectWinner: (gameId, card) ->
    game = Games.findOne(_id: gameId)
    game.players[card.player].score++ # find the player that submitted the card and give him a point
    game.currentTurn.unshift(game.currentTurn.pop()) # takes the player at the end of the array adn puts him at the beginning of the array
    GameFactory.dealOne(game.players, game.whiteDeck) # Deal card to all players with less than 10 cards
    game.table = GameFactory.dealTable(game.blackDeck) # Get a new question card
    game.submittedCards = [] # set submitted cards to empty

    Games.update
      _id: gameId
    ,
      game
