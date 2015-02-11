Meteor.startup ->
  if Cards.find().count() is 0
    masterCards.forEach (card) ->
      Cards.insert card
