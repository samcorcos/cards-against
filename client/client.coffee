Template.registerHelper 'formatDate', (x) ->
  moment(x).format('HH:mm MM/DD/YYYY')
