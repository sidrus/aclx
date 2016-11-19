class IdCardsController < ApplicationController
  before_action :check_role

  def select
  end

  def print
    @users = User.where(id: params[:print_id])
    render action: "print", layout: "print_id"
  end

  private
    def check_role
      unless current_admin.has_role?(:user_manager)
        redirect_to root_url, :flash => {error: "You must be a user manager to perform that action."}
      end
    end
end