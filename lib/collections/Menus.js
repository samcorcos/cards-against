// Menus = new Mongo.Collection("menus");
//
// // This collection is just going to be populated and used on the frontend
//
// Menus.allow({
//   insert: function(userId, doc) {
//     return false;
//   },
//   update: function(userId, docs, fields, modifier) {
//     return false;
//   },
//
//   remove: function(userId, docs) {
//     return false;
//   }
// });
//
// Menus.deny({
//   insert: function(userId, doc) {
//     return true;
//   },
//   update: function(userId, docs, fields, modifier) {
//     return true;
//   },
//   remove: function(userId, docs) {
//     return true;
//   }
// });
//
//
// if (Meteor.isServer) {
//   Meteor.publish("menus", function () {
//     return Menus.find({});
//   });
// }
//
//
// if (Meteor.isClient) {
//   Meteor.subscribe("menus");
// }
//
//
// // Users will have the following: starred (array of IDs), upvoted (array of IDS)
