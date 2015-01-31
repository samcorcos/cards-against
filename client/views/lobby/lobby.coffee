Template.lobby.rendered = ->


Template.lobby.events
  'click button#host-lobby': (e,t) ->
    IonModal.open("invitePlayersModal")

# Template.lobby.helpers
#   allPlayers: ->
#     Meteor.users.find _id:
#       $ne: Meteor.user()._id
