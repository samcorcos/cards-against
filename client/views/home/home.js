Template.home.rendered = function() {
  // Meteor.call("getMenus", function(err, res) {
  //   if (err) console.log("ERR", err);
  //   console.log(res);
  // })
  // Meteor.call("addItem", function(err, res) {
  //   if (err) console.log("ERR", err);
  // })
};

Template.home.helpers({
  database: function() {
    return Database.find();
  }
});

Template.home.events({

});
