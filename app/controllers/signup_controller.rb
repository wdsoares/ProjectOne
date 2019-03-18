class SignupController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      cookies.signed[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:notice] = "Email já cadastrado ou senha inválida!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email, :zap, :endereco, :password, :password_confirmation)
  end
end