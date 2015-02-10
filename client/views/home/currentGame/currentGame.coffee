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
    game.players[userId]


Template._hand.events
  'click .ion-arrow-right-a': (e,t) ->
    Meteor.call 'submitCard', t.data._id, Meteor.user()._id, this, (err, res) ->
      alert res if res

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

Template.currentGame.events
  'click .ion-checkmark-round': (e,t) ->
    console.log  this
    a = confirm "Are you sure you want to pick this card?"
    if a
      data = Template.currentData()
      Meteor.call 'selectWinner', data._id, this
