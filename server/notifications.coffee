Meteor.methods
  sendNotification: (userId, lobbyId, hostName) ->
    sendTo = Meteor.users.findOne(_id: userId)
    Meteor.users.update
      _id: userId
    ,
      $push:
        invite:
          hostName: hostName
          lobbyId: lobbyId

  removeNotification: (lobbyId) ->
    Meteor.users.update
      _id: @userId
    ,
      $pull:
        invite:
          lobbyId: lobbyId

    # Lobby.update # this is not currently working
    #   _id: lobbyId
    # ,
    #   $pull:
    #     players:
    #       id: @userId
    console.log "Successfully removed #{lobbyId}"

    # should also remove the user from the invited player list in the relevant lobby
