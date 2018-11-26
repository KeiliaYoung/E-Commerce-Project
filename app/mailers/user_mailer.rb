class UserMailer < ApplicationMailer
  default from: "keiliayoung@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'keiliayoung@gmail.com',
         subject: "A new contact form message from #{name}")
  end

end
