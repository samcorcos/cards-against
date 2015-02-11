if Meteor.isServer
  Meteor.publish "users", ->
    Meteor.users.find {} ,
      username: 1 # returns only username

if Meteor.isClient
  Meteor.subscribe "users"
