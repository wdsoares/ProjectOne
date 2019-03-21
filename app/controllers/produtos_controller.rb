class ProdutosController < ApplicationController
  def new
    # render the login form
  end

  def create
    @produto = Produto.new(produto_params)
    @produto.user_id = current_user.id if current_user

    if @produto.save
        redirect_to home_path
    else
      flash.now[:notice] = "Ocorreu um problema, verifique os dados e tente novamente!"
      render :new
    end
  end

  private

  def produto_params
    params.require(:produto).permit(:titulo, :autores, :edicao, :data_pub, :data_pub, :isbn, :editora)
  end
end
