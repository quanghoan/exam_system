class UserMailer < ApplicationMailer
	default from: "hoandq@kaopiz.com"

  def send_mail(user)
    @user = user
    message = "Registration - kaopiz test"    
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "hoandq@kaopiz.com", password: "abcd@1234", authentication: "plain" }
    mail subject: message, to: [ " ", user.nil? ? nil : user.email ], delivery_method_options: delivery_options   
  end

  def password_reset(user)
    @user = user
    message = "Reset Password - kaopiz test"    
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "hoandq@kaopiz.com", password: "abcd@1234", authentication: "plain" }
    mail subject: message, to: [ " ", user.nil? ? nil : user.email ], delivery_method_options: delivery_options   
  end
end
