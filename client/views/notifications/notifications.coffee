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
    ,
      $pull:
        invitedPlayers: Meteor.user()._id

    Meteor.call "removeNotification", @lobbyId
    Router.go "/lobby/#{lobbyId}"



  'click .ion-close-round': (e,t) ->
    Meteor.call "removeNotification", @lobbyId
    Lobby.update
      _id: @lobbyId
    ,
      $pull:
        invitedPlayers: Meteor.user()._id


Template.notifications.helpers
  allNotifications: ->
    Meteor.user().invite
