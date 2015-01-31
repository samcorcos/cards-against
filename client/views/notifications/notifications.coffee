Template.notifications.rendered = ->


Template.notifications.events {}

Template.notifications.helpers
  allNotifications: ->
    Meteor.user().invite
