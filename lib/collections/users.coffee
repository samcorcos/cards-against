

if Meteor.isServer
  Meteor.publish "users", ->
    Meteor.users.find {},
      username: 1
