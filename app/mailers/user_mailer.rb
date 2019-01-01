class UserMailer < ApplicationMailer
  default from: "keiliayoung@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'keiliayoung@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "Riding-Vintage"
    mail(to: user.email,
       subject: "Welcome to #{@appname}!")
  end

end
