MenuItems = new Mongo.Collection("menuItems");

var Schemas = {};

Schemas.MenuItem = new SimpleSchema({
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
MenuItems.attachSchema(Schemas.MenuItem)

MenuItems.allow({
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

MenuItems.deny({
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
  // Meteor.publish("menuItems", function () {
  //   return MenuItems.find({});
  // });
}


if (Meteor.isClient) {
  // Meteor.subscribe("menuItems");
}
