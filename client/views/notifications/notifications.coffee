Template.notifications.rendered = ->


Template.notifications.events
  'click .ion-checkmark-round': (e,t) ->
    # should we make a method for updating the lobby's current player list?
    lobbyId = @lobbyId

    Lobby.update
      _id: lobbyId
    ,
      $addToSet:
        players:
          id: Meteor.user()._id
          username: Meteor.user().username

    Router.go "/lobby/#{lobbyId}"



  'click .ion-close-round': (e,t) ->
    # should remove the notification from the user
    # should also remove the user from the invited player list in the relevant lobby
    # Meteor.call "removeNotification", noteId


Template.notifications.helpers
  allNotifications: ->
    Meteor.user().invite
