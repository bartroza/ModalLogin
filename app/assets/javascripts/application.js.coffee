require [
  'jquery'
  'models/user'
  'models/token'
  'routers/app_router'
  'routers/sessions_router'
  'views/sessions/login_bar_view'
  'views/tokens/show_view'
  'helpers/alert_queue'
  'backbone-rails'
  'hamlcoffee'
],

($, User, Token, AppRouter, SessionsRouter, LoginBar, TokensView, AlertQueue) ->
    currentUser = new User(vars.currentUser)
    token = new Token()
    new TokensView(model: token)
    new AppRouter()
    view = new LoginBar(model: currentUser)
    $("#add-bar").html(view.render().el)
    new SessionsRouter(user: currentUser, token: token)
    Backbone.history.start()
  