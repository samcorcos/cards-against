@CurrentLobbyController = RouteController.extend(
  template: "currentLobby"
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
      Meteor.subscribe "lobby"
    ]


  #WAIT_FUNCTION
  data: ->
    params: @params or {}


  #DATA_FUNCTION
  onAfterAction: ->
)
