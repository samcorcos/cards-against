MuddMenuItems = new Mongo.Collection("muddMenuItems");

MuddMenuItems.attachSchema(ItemSchemas.MenuItem)

MuddMenuItems.allow({
  insert: function(userId, doc) {
    return false;
  },
  update: function(userId, docs, fields, modifier) {
    return false;
  },

  remove: function(userId, docs) {
    return false;
  }
});

MuddMenuItems.deny({
  insert: function(userId, doc) {
    return true;
  },
  update: function(userId, docs, fields, modifier) {
    return true;
  },
  remove: function(userId, docs) {
    return true;
  }
});


if (Meteor.isServer) {
  // Meteor.publish("muddMenuItems", function () {
  //   return MuddMenuItems.find({});
  // });
}


if (Meteor.isClient) {
  // Meteor.subscribe("muddMenuItems");
}
