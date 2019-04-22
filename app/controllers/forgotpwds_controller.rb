class ForgotpwdsController < ApplicationController
  before_action :set_forgotpwd, only: [:show, :edit, :update, :destroy]

  # GET /forgotpwds
  # GET /forgotpwds.json
  def index
    @forgotpwds = Forgotpwd.all
  end

  # GET /forgotpwds/1
  # GET /forgotpwds/1.json
  def show
  end

  # GET /forgotpwds/new
  def new
    @forgotpwd = Forgotpwd.new
  end

  # GET /forgotpwds/1/edit
  def edit
  end

  # POST /forgotpwds
  # POST /forgotpwds.json
  def create
    @user = User.find_by("LOWER(email) = ?", user_params[:email].downcase)

    if (@user.present?)
      flash.now[:alert] = "Um email para recuperação de senha foi enviado ao seu endereço."
      redirect_to sessions_path
    else
      flash.now[:alert] = "Email não cadastrado!"
      render :new
    end
  end

  # PATCH/PUT /forgotpwds/1
  # PATCH/PUT /forgotpwds/1.json
  def update
    respond_to do |format|
      if @forgotpwd.update(forgotpwd_params)
        format.html { redirect_to @forgotpwd, notice: 'Forgotpwd was successfully updated.' }
        format.json { render :show, status: :ok, location: @forgotpwd }
      else
        format.html { render :edit }
        format.json { render json: @forgotpwd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forgotpwds/1
  # DELETE /forgotpwds/1.json
  def destroy
    @forgotpwd.destroy
    respond_to do |format|
      format.html { redirect_to forgotpwds_url, notice: 'Forgotpwd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def user_params
      params.require(:user).permit(:email)
    end

    def set_forgotpwd
      @forgotpwd = Forgotpwd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forgotpwd_params
      params.fetch(:forgotpwd, {})
    end
end
