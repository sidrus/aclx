class Admin < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  scope :event_coordinators, -> { Admin.select {|a| a.has_role?(:event_coordinator) && a.approved} }

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  def display_name
    # default display name is the username
    return username unless username.blank?

    # fallback on email, if no username
    return email
  end

  def roles_to_string
    if roles.count > 0 then
      return roles.map { |r| r.display_name }.join(', ')
    else
      return "No roles defined"
    end
  end
end
