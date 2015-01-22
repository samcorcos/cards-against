FrankMenuItems = new Mongo.Collection("frankMenuItems");

FrankMenuItems.attachSchema(ItemSchemas.MenuItem)

FrankMenuItems.allow({
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

FrankMenuItems.deny({
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
  Meteor.publish("frankMenuItems", function () {
    return FrankMenuItems.find({});
  });
}


if (Meteor.isClient) {
  Meteor.subscribe("frankMenuItems");
}
