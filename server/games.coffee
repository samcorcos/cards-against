Meteor.methods
  createGame: (playerIds) ->
    game = GameFactory.createGame(playerIds)
    Games.insert game

  # takeTurn: (gameId, playerId, card) ->
  #   game = Games.findOne( _id: gameId)
  #   hand = $.grep(game.players, (o) -> o.playerId is playerId)
