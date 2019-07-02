class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]
  def index
    @produto = Produto.where('titulo LIKE ? AND visivel = 1', "%#{params[:tituloBusc]}%").order('created_at DESC')
  end

  def nova
    @comprador = cookies.signed[:user_id]
    prod = Produto.where('id = ?', params[:idproduto]).take
    vendedor = prod.user_id
    sql = "INSERT INTO vendas(idcomprador,idvendedor,idproduto, estado) VALUES (#{@comprador}, #{vendedor},#{params[:idproduto]},0)"
    results = ActiveRecord::Base.connection.execute(sql)
    sql2 = "UPDATE produtos SET visivel = 0 WHERE id = #{params[:idproduto]}"
    results = ActiveRecord::Base.connection.execute(sql2)
    redirect_to comprar_path
  end

  private
  def set_compra
    @produto = Produto.find(params[:id])
  end

  def compras_params
    params.require(:compra).permit(:titulo)
  end
end
