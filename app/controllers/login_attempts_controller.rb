class LoginAttemptController < ApplicationController
  def update
  	@user = User.find(params[:id])
  	
  end
end
