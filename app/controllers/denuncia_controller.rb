class DenunciaController < ApplicationController
  before_action :set_denuncium, only: [:show, :edit, :update, :destroy]

  # GET /denuncia
  # GET /denuncia.json
  def index

  end

  # GET /denuncia/1
  # GET /denuncia/1.json
  def show
  end

  # GET /denuncia/new
  def new
    
    @produtoimagem = Produtoimagem.where(:produto_id => params[:id]).take

    @produto = Produto.where(:id => params[:id]).take
    
  end

  # GET /denuncia/1/edit
  def edit
  end

  # POST /denuncia
  # POST /denuncia.json
  def create
    @den = Denuncium.new(denuncium_params)
    @den.id_delator = cookies.signed[:user_id]
    
    if @den.save
      flash.now[:notice] = "Anúncio criado com sucesso!"
      redirect_to anuncios_path

    else
      flash.now[:notice] = "Ocorreu um problema, verifique os dados e tente novamente!"
      redirect_to home_path
    end
  end

  # PATCH/PUT /denuncia/1
  # PATCH/PUT /denuncia/1.json
  def update

  end

  # DELETE /denuncia/1
  # DELETE /denuncia/1.json
  def destroy
    @denuncium.destroy
    respond_to do |format|
      format.html { redirect_to denuncia_url, notice: 'Denuncium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_denuncium
      @denuncium = Denuncium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def denuncium_params
      params.require(:denuncia).permit(:idAnuncio, :desc)
    end
end
