class ProdutoimagemsController < ApplicationController
  before_action :set_produtoimagem, only: [:show, :edit, :update, :destroy]

  # GET /produtoimagems
  # GET /produtoimagems.json
  def index
    @produtoimagems = Produtoimagem.all
  end

  # GET /produtoimagems/1
  # GET /produtoimagems/1.json
  def show
  end

  # GET /produtoimagems/new
  def new
    @produtoimagem = Produtoimagem.new
  end

  # GET /produtoimagems/1/edit
  def edit
  end

  # POST /produtoimagems
  # POST /produtoimagems.json
  def create
    @produtoimagem = Produtoimagem.new(produtoimagem_params)

    respond_to do |format|
      if @produtoimagem.save
        format.html { redirect_to @produtoimagem, notice: 'Produtoimagem was successfully created.' }
        format.json { render :show, status: :created, location: @produtoimagem }
      else
        format.html { render :new }
        format.json { render json: @produtoimagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtoimagems/1
  # PATCH/PUT /produtoimagems/1.json
  def update
    respond_to do |format|
      if @produtoimagem.update(produtoimagem_params)
        format.html { redirect_to @produtoimagem, notice: 'Produtoimagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @produtoimagem }
      else
        format.html { render :edit }
        format.json { render json: @produtoimagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtoimagems/1
  # DELETE /produtoimagems/1.json
  def destroy
    @produtoimagem.destroy
    respond_to do |format|
      format.html { redirect_to produtoimagems_url, notice: 'Produtoimagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produtoimagem
      @produtoimagem = Produtoimagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produtoimagem_params
      params.require(:produtoimagem).permit(:idproduto, :imagem)
    end
end
