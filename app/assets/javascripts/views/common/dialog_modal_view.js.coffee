define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/dialog'
], ($, Backbone, App) ->

  class App.Views.Common.DialogView extends Backbone.View
    template: JST["common/dialog"]
    
    initialize: (options) ->
        super(options)
        
    # events: ->
    #   'click .close': 'reject'

    render: ->
      $(@el).html(@template())
      $('.modal', @el).modal()
      $('.modal', @el).on 'hidden', @cleanup
      return @

    # reject: ->
    #   # @model.destroy()
    #   @remove()
    
    show: ->
      $('.modal', @el).modal('show')

    hide: ->
      $('.modal', @el).modal('hide')

    cleanup: ->
      # ?