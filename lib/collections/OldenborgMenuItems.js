OldenborgMenuItems = new Mongo.Collection("oldenborgMenuItems");

OldenborgMenuItems.attachSchema(ItemSchemas.MenuItem)

OldenborgMenuItems.allow({
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

OldenborgMenuItems.deny({
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
  Meteor.publish("oldenborgMenuItems", function () {
    return OldenborgMenuItems.find({});
  });
}


if (Meteor.isClient) {
  Meteor.subscribe("oldenborgMenuItems");
}
