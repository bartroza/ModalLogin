define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/form_view'
  'views/common/dialog_modal_view'
], ($, Backbone, App, FormView, DialogModalView) ->

  class App.Views.Common.DialogView extends FormView
    
    className: -> "modal"
      
    initialize: ->
      # console.log @$el
      view = new DialogModalView()
      
      # $('body').append(view.el)
      # view.render()
      # view.show()
      # return
      
      # @modal = $(view.render().el.children)
      # @modal.find(".modal-body").append(@template())
      # @modal.modal('show')
      
      $(view.render().el).find(".modal-body").append(@template())
      $(view.render().el.children).modal('show')
      