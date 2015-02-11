Template.settings.rendered = ->
  IonModal.open "signInModal" if not Meteor.loggingIn() and not Meteor.user()

Template.settings.helpers
  username: ->
    Meteor.user().username

Template.settings.events
  'click #logout-button': ->
    Meteor.logout()

  'click #login-create-button': ->
    IonModal.open 'signInModal'
