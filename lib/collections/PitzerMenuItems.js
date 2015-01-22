PitzerMenuItems = new Mongo.Collection("pitzerMenuItems");

PitzerMenuItems.attachSchema(ItemSchemas.MenuItem)

PitzerMenuItems.allow({
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

PitzerMenuItems.deny({
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
  // Meteor.publish("pitzerMenuItems", function () {
  //   return PitzerMenuItems.find({});
  // });
}


if (Meteor.isClient) {
  // Meteor.subscribe("pitzerMenuItems");
}
