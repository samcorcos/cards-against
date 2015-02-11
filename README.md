# Cards Against Humanity Mobile
A mobile version of cards against humanity. Uses Ionic and Meteor.

Demo: [cag.meteor.com](http://cag.meteor.com)

## How to play

1. Create an account
2. Host a lobby or get invited to join a lobby
3. Start a game
4. ???
5. Profit

## Most interesting parts of the project

The entire game engine is 50 lines of `coffeescript` (see `/lib/factories/gameFactory.coffee`)

The lobby uses an `@autorun` to route all users in the current lobby to the new game url (thank you [Stack Overflow](http://stackoverflow.com/questions/28417668/meteor-1-0-hosting-a-lobby-and-redirecting-other-users)):

```
Template.currentLobby.rendered = ->
  @autorun ->
    data = Template.currentData()
    if data.url
      Router.go data.url
```

