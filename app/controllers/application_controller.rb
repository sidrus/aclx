class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_referer

  private 
    def set_referer
      session[:return_to] ||= request.referer
    end
end
