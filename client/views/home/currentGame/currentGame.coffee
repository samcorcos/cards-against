Template.currentGame.helpers
  yourTurn: ->
    game = Games.findOne( _id: @_id)
    if game.currentTurn[0] is Meteor.user()._id then true else false

  players: ->
    data = Template.currentData()
    playersArray = []
    for key,value of data.players
      playersArray.push(value.playerName)
    playersArray

Template._hand.helpers
  currentHand: ->
    game = Games.findOne( _id: @_id)
    userId = Meteor.user()._id
    # res = $.grep(game.players, (o) -> o[playerId] is Meteor.user()._id)
    # console.log res
    # res[0]
    game.players[userId]




Template._hand.events
  'click .ion-arrow-right-a': (e,t) ->
    Meteor.call('submitCard', t.data._id, Meteor.user()._id, this)
    # if t.data.currentTurn[0] is not Meteor.user()._id
    #   Meteor.call('takeTurn', t.data._id, Meteor.user()._id, this)

Template._score.helpers
  currentScore: ->
    game = Games.findOne( _id: @_id)
    score = []
    for key,value of game.players
      o = {}
      o.player = value.playerName
      o.score = value.score
      score.push(o)
    score
