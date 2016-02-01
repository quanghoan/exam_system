class UserMailer < ApplicationMailer
	default from: "hoandq@kaopiz.com"

  def sendmail(user)
    @user = user
    message = "registration - kaopiz test"    
    delivery_options = { 
    	address: "gator3103.hostgator.com", 
    	port: 587, user_name: "hoandq@kaopiz.com",
    	pasword: "abcd@1234", 
    	authentication: "plain" }
    mail subject: message, 
    to: [ " ", user.nil? ? nil : user.email ], 
    delivery_method_options: delivery_options  
  end
end
