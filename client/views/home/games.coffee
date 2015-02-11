Template.home.helpers
  gameData: ->
    Games.find()

  formatNames: (players) ->
    temp = []
    for key,value of players
      temp.push(value.playerName)
    temp.join(", ")
