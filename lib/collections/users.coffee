

if Meteor.isServer
  Meteor.publish "users", ->
    Meteor.users.find {},
      username: 1

if Meteor.isClient
  Meteor.subscribe "users"
