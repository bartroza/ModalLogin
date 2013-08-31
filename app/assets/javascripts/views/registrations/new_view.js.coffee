define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/registration'
  'views/common/form_view'
  'templates/registrations/new'
], ($, Backbone, App, Registration, FormView) ->

  class App.Views.Registrations.NewView extends FormView
    template: JST["registrations/new"]

    success: (session) ->
      @options.user.id = session.id
      @options.user.fetch()
      @addSuccessAlert("Ok")
      window.location.hash = "/"

    error: (post, jqXHR) ->
      @model.set($.parseJSON(jqXHR.responseText))