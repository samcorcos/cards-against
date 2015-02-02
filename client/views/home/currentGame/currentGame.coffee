Template.currentGame.rendered = ->

Template.currentGame.events {}

Template.currentGame.helpers {}

###
Need to display the current black card
Need to display the cards in this user's hand
###


Template._hand.helpers
  currentHand: ->
    game = Games.findOne( _id: @_id)
    res = $.grep(game.players, (o) -> o.playerId is Meteor.user()._id)
    res[0]

Template._hand.events
  'click .ion-arrow-right-a': (e,t) ->
    console.log this # this is the event for choosing a card

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
