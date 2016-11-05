class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_admin!
  before_action :set_referer

  private 
    def set_referer
      session[:return_to] ||= request.referer
    end
end
