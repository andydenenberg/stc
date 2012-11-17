class UserMailer < ActionMailer::Base
  default :from => "admin@standtallcampaign.org"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Welcome to our Colaboration!")
  end
end