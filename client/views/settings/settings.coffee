Template.settings.rendered = ->
  IonModal.open "signInModal" if not Meteor.loggingIn() and not Meteor.user()
