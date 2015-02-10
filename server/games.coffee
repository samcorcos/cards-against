Meteor.methods
  createGame: (playerIds) ->
    game = GameFactory.createGame(playerIds)
    Games.insert game


  submitCard: (gameId, playerId, card) ->
    game = Games.findOne(_id: gameId)

    # Games.update
    #   _id: gameId
    # ,
    #   $addToSet:
    #     submittedCards:
    #       card: card
    #       player: playerId

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

    # find the game DONE
    # add the card to the "submitted cards" DONE
    # remove the card from the player's hand

  selectWinner: (gameId, card) ->
    game = Games.findOne(_id: gameId)

    # game.currentTurn.unshift(game.currentTurn.pop()) # takes the player at the end of the array adn puts him at the beginning of the array
    # On click... have a confirmation?
