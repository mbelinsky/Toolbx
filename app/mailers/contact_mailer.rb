class ContactMailer < ActionMailer::Base
  default from: Settings.email.from, to: Settings.email.to

  def new_message(contact_message)
    @contact_message = contact_message

    mail reply_to: contact_message.email, subject: "New Message from #{contact_message.first_name} #{contact_message.last_name}"
  end
end