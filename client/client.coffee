Meteor.startup ->
  # console.log masterCards

Template.registerHelper 'formatDate', (x) ->
  moment(x).format('HH:mm MM/DD/YYYY')
