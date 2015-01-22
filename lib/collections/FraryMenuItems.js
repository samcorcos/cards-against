FraryMenuItems = new Mongo.Collection("fraryMenuItems");

FraryMenuItems.attachSchema(ItemSchemas.MenuItem)

FraryMenuItems.allow({
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

FraryMenuItems.deny({
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
  Meteor.publish("fraryMenuItems", function () {
    return FraryMenuItems.find({});
  });
}


if (Meteor.isClient) {
  Meteor.subscribe("fraryMenuItems");
}
