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

    # cardIdToRemove = undefined
    # game.players.forEach (player) ->
    #   player.hand.forEach (xcard) ->
    #     if xcard._id is card._id
    #       cardIdToRemove = xcard._id
    #
    # if cardIdToRemove is not undefined
    #   Games.update
    #     _id: gameId
    #   ,
    #     $pull:
    #       players:
    #         $elemMatch:
    #           $in: [cardIdToRemove]

      #   console.log cardIdToRemove
      #   console.log player.hand
      #   player.hand = _.filter(player.hand, (x) ->
      #     x._id is not cardIdToRemove
      #     console.log x._id
      #   )
      # player.hand.pop()


      # redefined the array as 9, then $set it



    # find the game
    # add the card to the "submitted cards"
    # remove the card from the player's hand
    # make sure user has 10 cards?

  selectWinner: (gameId, card) ->





  # takeTurn: (gameId, playerId, card) ->
  #   game = Games.findOne( _id: gameId)
  #   hand = $.grep(game.players, (o) -> o.playerId is playerId)
