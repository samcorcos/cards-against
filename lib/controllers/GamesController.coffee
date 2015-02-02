@GamesController = RouteController.extend(
  template: "currentGame"
  yieldTemplates: {}

  #YIELD_TEMPLATES
  onBeforeAction: ->

    #BEFORE_FUNCTION
    @next()
    return

  action: ->
    @render()
    return


  #ACTION_FUNCTION
  waitOn: ->
    [
      Meteor.subscribe "games"
    ]


  #WAIT_FUNCTION
  data: ->
    params: @params or {}


  #DATA_FUNCTION
  onAfterAction: ->
)
