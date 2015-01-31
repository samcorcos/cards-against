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
