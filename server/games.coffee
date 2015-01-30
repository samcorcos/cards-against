Meteor.methods
  createGame: (playerIds) ->
    game = GameFactory.createGame(playerIds)
    Games.insert game
