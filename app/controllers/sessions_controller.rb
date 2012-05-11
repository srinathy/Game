class SessionsController < ApplicationController
  def create
    @title = "Sign In"
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      current_basket.user = current_user
      current_basket.save
      sign_in user
      redirect_to current_basket, notice: "You have been successfully signed in! Welcome back #{user.name}"
    else
      render 'new', notice: "Incorrect Login Details!"
    end
  end
  
  def destroy
    sign_out
    redirect_to signin_path, notice: "You have been successfully signed out."
  end
end
