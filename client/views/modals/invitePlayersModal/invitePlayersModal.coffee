Template.invitePlayersModal.rendered = ->


Template.invitePlayersModal.events {}

Template.invitePlayersModal.helpers
  allPlayers: ->
    Meteor.users.find _id:
      $ne: Meteor.user()._id

  currentGame: ->
    true



Template._playerItem.helpers
  invited: ->


  accepted: ->


  available: ->
    true

Template._playerItem.events
  'click button': (e,t) ->
