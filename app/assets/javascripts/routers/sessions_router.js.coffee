define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'helpers/layout'
  'helpers/alert_queue'
  'views/sessions/new_view'
  'views/registrations/new_view'
  'models/registration'
  'views/common/alert_view'
],
  
($, Backbone, App, Session, Layout, AlertQueue) ->
  class App.Routers.SessionsRouter extends Backbone.Router
    initialize: (options) ->
      @root  = $("#content")
      @user  = options.user
      # @guest = options.guest
      @token = options.token
      @session = new Session(@user)
      @user.on('change', =>
        @session = new Session(@user)
        @token.fetch()
      )

    routes:
      "signup":               "newRegistration"
      "signin":               "newSession"
      "signout":              "destroy"

    newRegistration: ->
      View = require 'views/registrations/new_view'
      Model = require 'models/registration'
      @view = new View(model: new Model(), user: @user)
      Layout.setContent(@view)

    newSession: ->
      View = require 'views/sessions/new_view'
      @view = new View(model: @session, user: @user, token: @token)
      Layout.setContent(@view)

    destroy: ->
      @session.destroy(
        success: (session, response) =>
          # @user.set(@guest.attributes)
          AlertQueue.add({type: 'info', message: "Destroyed"})
          window.location.hash = "/"
      )

