class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  require "mini_magick"
  
  def new
    if (cookies[:user_id].blank?)
      redirect_to sessions_path
    else
    end
  end

  def index
    if (cookies[:user_id].blank?)
      redirect_to sessions_path
    else
      @produto = Produto.where(:user_id => current_user.id)
    end
  end

  def create
    @produto = Produto.new(produto_params)
    @produto.visivel = '1'
    @produto.user_id = current_user.id if current_user

    if @produto.save
          params[:produtoimagem]['imagem'].each do |a|
            uploader = ImageUploader.new
            uploader.store!(a)
            produtoimagens = Produtoimagem.new
            produtoimagens.produto_id = @produto.id
            produtoimagens.imagem = a
            produtoimagens.save!
          end
          flash.now[:notice] = "Anúncio criado!"
          redirect_to home_path
    else
      flash.now[:notice] = "Ocorreu um problema, verifique os dados e tente novamente!"
      render :new
    end
  end

  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to anuncios_path, notice: 'Produto deletado com sucesso!'}
      format.json { head :no_content }
    end
  end


  private

  def produto_params
    params.require(:produto).permit(:titulo, :autores, :edicao, :data_pub, :data_pub, :isbn, :editora, 
      produtoimagem_attributes: [:produto_id, :imagem])
  end
  def set_produto
    @produto = Produto.find(params[:id])
  end
end
