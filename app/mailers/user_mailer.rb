class UserMailer < ActionMailer::Base
  default :from => "andy@ospreypointcap.com"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Welcome to our Colaboration!")
  end
end