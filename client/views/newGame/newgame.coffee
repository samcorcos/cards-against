Template.newGame.rendered = ->


Template.newGame.events {}

Template.newGame.helpers
  allPlayers: ->
    Meteor.users.find _id:
      $ne: Meteor.user()._id



Template._playerItem.helpers
  invited: ->


  accepted: ->


  available: ->
    true
