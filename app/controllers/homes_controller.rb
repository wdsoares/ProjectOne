class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes/new
  def new
    if (cookies[:user_id].blank?)
      redirect_to sessions_path
    end
  end
  

  # GET /homes/1/edit
  def edit
  end

  def index
    if ((cookies[:user_id].blank?) || (cookies[:user_level] != '50'))
      redirect_to exit_path, alert: "Você não tem permissão para acessar esta área! Faça login novamente."
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:home, {})
    end
end
