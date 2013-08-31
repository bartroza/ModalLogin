define [
  'jquery'
  'backbone'
  'bootstrap'
], ($, Backbone, App) ->
  class AlertQueue extends Backbone.Collection

    add: (obj) ->
      console.log obj
      obj['shown'] = false
      super obj

    clear: ->
      console.log m
      m.destroy() for m in @models when m? and m.get('shown') is true

  App.Helpers.AlertQueue = new AlertQueue()