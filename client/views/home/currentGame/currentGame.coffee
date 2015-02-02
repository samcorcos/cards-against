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
