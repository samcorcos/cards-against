Template.home.rendered = function() {
  Meteor.call("getMenus", function(err, res) {
    if (err) console.log("ERR", err);
    console.log(res);
  })
};

Template.home.helpers({

});

Template.home.events({

});
