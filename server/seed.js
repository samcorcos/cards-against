Meteor.startup(function () {
  Database.remove({});
  Database.insert({
    name: "Chicken",
    upvotes: 0,
    college: "CMC"
  })
  Database.insert({
    name: "Steak",
    upvotes: 0,
    college: "CMC"
  })
  Database.insert({
    name: "Animals",
    upvotes: 2,
    college: "CMC"
  })
  Database.insert({
    name: "Woot",
    upvotes: 5,
    college: "CMC"
  })
  Database.insert({
    name: "Food",
    upvotes: 1,
    college: "CMC"
  })
  Database.insert({
    name: "Books",
    upvotes: 0,
    college: "CMC"
  })
  Database.insert({
    name: "Phones",
    upvotes: 0,
    college: "CMC"
  })
  Database.insert({
    name: "Soups",
    upvotes: 0,
    college: "CMC"
  })
});
