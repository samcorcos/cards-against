Template.settings.rendered = ->
  IonModal.open "signInModal" if not Meteor.loggingIn() and not Meteor.user()

Template.settings.helpers
  userEmail: ->
    Meteor.user().emails[0].address

Template.settings.events
  'click #logout-button': ->
    Meteor.logout()

  'click #login-create-button': ->
    IonModal.open('signInModal')

  
