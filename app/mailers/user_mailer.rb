class UserMailer < ActionMailer::Base
  include MarkdownTools

  layout 'mailer', except: [:welcome]

  def welcome(user)
    @user = user

    mail to: user.email, subject: "Welcome to The Toolbox!"
  end

  def password_reset(user)
    @user = user

    mail to: user.email, subject: "The Toolbox Password Reset"
  end
end
