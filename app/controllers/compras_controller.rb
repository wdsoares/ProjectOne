class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]
  def index
    @produto = Produto.where('titulo LIKE ?', "%#{params[:tituloBusc]}%")
  end

  private
  def set_compra
    @produto = Produto.find(params[:id])
  end

  def compras_params
    params.require(:compra).permit(:titulo)
  end
end
