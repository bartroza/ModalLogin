define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'views/common/dialog_view'
  'templates/sessions/new'
], ($, Backbone, App, Session, DialogView) ->

  class App.Views.Sessions.NewView extends DialogView
    template: JST["sessions/new"]
    
    success: (session) ->
      @options.user.id = session.id
      @options.user.fetch()
      @addSuccessAlert("Logged in")
      window.location.hash = "/"