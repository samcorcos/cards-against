CMCMenuItems = new Mongo.Collection("cmcMenuItems");

ItemSchemas = {};

ItemSchemas.MenuItem = new SimpleSchema({
  itemName: {
    type: String,
    label: "Item Name",
    unique: true
  },
  upvotes: {
    type: Number,
    label: "Upvotes"
  },
  college: {
    type: String,
    label: "College"
  }
})

// We are not going to attach a schema during development
CMCMenuItems.attachSchema(ItemSchemas.MenuItem)

CMCMenuItems.allow({
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

CMCMenuItems.deny({
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
  // Meteor.publish("cmcMenuItems", function () {
  //   return CMCMenuItems.find({});
  // });
}


if (Meteor.isClient) {
  // Meteor.subscribe("cmcMenuItems");
}
