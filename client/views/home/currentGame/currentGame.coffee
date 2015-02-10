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
    res = $.grep(game.players, (o) -> o.playerId is Meteor.user()._id)
    res[0]

Template._hand.events
  'click .ion-arrow-right-a': (e,t) ->
    Meteor.call('submitCard', t.data._id, Meteor.user()._id, this)
    # if t.data.currentTurn[0] is not Meteor.user()._id
    #   Meteor.call('takeTurn', t.data._id, Meteor.user()._id, this)

Template._score.helpers
  currentScore: ->
    game = Games.findOne( _id: @_id)
    score = []
    game.players.forEach (player) ->
      o = {}
      o.player = player.playerName
      o.score = player.score
      score.push(o)
    score
