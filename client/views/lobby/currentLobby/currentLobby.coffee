Template.currentLobby.rendered = ->
  console.log this.data

Template.currentLobby.events {}

Template.currentLobby.helpers
  hostname: ->
    Meteor.users.findOne
      _id: @host
