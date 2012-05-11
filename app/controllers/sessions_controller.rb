class SessionsController < ApplicationController

  def new
  end
  def create
    @title = "Sign In"
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      current_basket.user = current_user
      current_basket.save
      sign_in user
      redirect_to user, notice: "You have been successfully signed in! Welcome back #{user.name}"
    else
      format.html { render action: "new" }
      format.json { render json: user.errors, status: :unprocessable_entity }
    end

  end

  def destroy
    sign_out
    redirect_to signin_path, notice: "You have been successfully signed out."
  end
end
