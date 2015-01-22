ScrippsMenuItems = new Mongo.Collection("scrippsMenuItems");

ScrippsMenuItems.attachSchema(ItemSchemas.MenuItem)

ScrippsMenuItems.allow({
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

ScrippsMenuItems.deny({
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
  Meteor.publish("scrippsMenuItems", function () {
    return ScrippsMenuItems.find({});
  });
}


if (Meteor.isClient) {
  Meteor.subscribe("scrippsMenuItems");
}
