class ContactsMailer < ApplicationMailer
  def contact_email(user, message)
    @message = message

    mail to: ENV['ADMIN_EMAIL'], subject: user.email
  end
end
