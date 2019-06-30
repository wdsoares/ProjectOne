class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]
  def index
    @produto = Produto.where('titulo LIKE ? AND visivel > 0', "%#{params[:tituloBusc]}%")
  end

  def nova
    @comprador = cookies.signed[:user_id]
    prod = Produto.where('id = ?', params[:idproduto]).take
    vendedor = prod.user_id
    sql = "INSERT INTO vendas(idcomprador,idvendedor,idproduto) VALUES (#{@comprador}, #{vendedor},#{params[:idproduto]})"
    results = ActiveRecord::Base.connection.execute(sql)
    sql2 = "UPDATE produtos SET visivel = 0 WHERE id = #{params[:idproduto]}"
    results = ActiveRecord::Base.connection.execute(sql2)
    render :index
  end

  private
  def set_compra
    @produto = Produto.find(params[:id])
  end

  def compras_params
    params.require(:compra).permit(:titulo)
  end
end
