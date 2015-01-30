

if Meteor.isServer
  Meteor.publish "users", ->
    Meteor.users.find
      _id:
        $not:
          Meteor.user()._id # finds all other users that are not the current user
    ,
      username: 1 # returns only username

if Meteor.isClient
  Meteor.subscribe "users"
