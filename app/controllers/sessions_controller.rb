class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path(session[:user_id])
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    logout()
    redirect_to root_path
  end
end
