class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery
  before_filter :set_token
  def set_token
    @token = form_authenticity_token
  end
end
