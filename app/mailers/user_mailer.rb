class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "http://localhost:3000/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(:to => user.email,
    :subject => "Your account is now activated")    
  end
  
  def reset_password_email(user)
      @user = user
      @url  = "http://localhost:3000/password_resets/#{user.reset_password_token}/edit"
      mail(:to => user.email,
        :subject => "Your password has been reset")

  end
  
end
