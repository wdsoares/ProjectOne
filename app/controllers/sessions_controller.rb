class SessionsController < ApplicationController

  def new
    # render the login form
  end
  
  def create
    @user = User.find_by("LOWER(email) = ?", user_params[:email].downcase)

    if (@user.present? && @user.authenticate(user_params[:password])) && @user.user_level == 1
      cookies.permanent.signed[:user_id] = @user.id
      redirect_to home_path
    elsif (@user.present? && @user.authenticate(user_params[:password])) && @user.user_level == 50
      cookies.permanent.signed[:user_id] = @user.id
      cookies.permanent[:user_level] = @user.user_level
      redirect_to admin_path
    else
      flash.now[:alert] = "Usuário ou senha incorreta!"
      render :new
    end
  end

  def destroy
    cookies.delete(:user_id)
    cookies.delete(:user_level)
    redirect_to sessions_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end