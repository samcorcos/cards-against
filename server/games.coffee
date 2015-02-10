Meteor.methods
  createGame: (playerIds) ->
    game = GameFactory.createGame(playerIds)
    Games.insert game


  submitCard: (gameId, playerId, card) ->
    game = Games.findOne(_id: gameId)

    Games.update
      _id: gameId
    ,
      $addToSet:
        submittedCards:
          card: card
          player: playerId

    hand = game.players[playerId].hand
    console.log hand


    # find the game
    # add the card to the "submitted cards"
    # remove the card from the player's hand
    # make sure user has 10 cards?

  selectWinner: (gameId, card) ->





  # takeTurn: (gameId, playerId, card) ->
  #   game = Games.findOne( _id: gameId)
  #   hand = $.grep(game.players, (o) -> o.playerId is playerId)
