define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Routers.AppRouter extends Backbone.Router
    routes:
      "" : "/"