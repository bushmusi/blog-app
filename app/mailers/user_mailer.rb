class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer' # to make sure that your mailer uses the devise views

  def welcome_reset_password_instructions(user)
    create_reset_password_token(user)
    mail(to: user.email, subject: 'Welcome to the New Site')
  end

  private
end
