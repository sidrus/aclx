class Admin < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  scope :event_coordinators, -> { Admin.select {|a| a.has_role?(:event_coordinator) && a.approved} }
  scope :developers, -> { Admin.select {|a| a.has_role?(:developer) && a.approved} }
  scope :user_managers, -> { Admin.select {|a| a.has_role?(:user_manager) && a.approved} }
  scope :administrators, -> { Admin.select {|a| a.has_role?(:administrator) && a.approved} }

  after_create :send_creation_email

  has_many :events

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

  def send_creation_email
    AclxMailer.new_admin_waiting_for_approval(self).deliver
  end
end
