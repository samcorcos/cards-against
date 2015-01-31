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
    console.log "Successfully removed #{lobbyId}"
