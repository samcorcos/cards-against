Template.signInModal.events
  'click #create-account-button': (e,t) ->
    Accounts.createUser
      username: t.find('#username').value
      password: t.find('#password').value
    ,
      (err) ->
        if err
          $('#password').val('')
          alert err.message
        else
          IonModal.close()

  'click #login-button': (e,t) ->
    Meteor.loginWithPassword t.find('#username').value, t.find('#password').value, (err) ->
      if err
        $('#password').val('')
        alert err.message
      else
        IonModal.close()
