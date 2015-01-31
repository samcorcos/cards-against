Template.home.rendered = ->

Template.home.events {}

Template.home.helpers
  gameData: ->
    Games.find()
