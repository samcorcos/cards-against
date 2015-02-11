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
    turn = true
    t.data.submittedCards.forEach (pair) ->
      if pair.player is Meteor.user()._id
        turn = false

    if turn is true and confirm("Are you sure you want to pick this card?")
      Meteor.call 'submitCard', t.data._id, Meteor.user()._id, this
    else
      alert "Already played!"

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
    if confirm "Are you sure you want to pick this card?"
      data = Template.currentData()
      Meteor.call 'selectWinner', data._id, this
