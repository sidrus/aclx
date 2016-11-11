class AclxMailer < Devise::Mailer   
  helper :application 
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def new_admin_waiting_for_approval(admin)
    @admin = admin
    @url = admins_url

    mail(to: Admin.administrators.pluck(:email), from: "no-reply@brandonfrie.com", subject: "New Admin Registration Request" )
  end
end