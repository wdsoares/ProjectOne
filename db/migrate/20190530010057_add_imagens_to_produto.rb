class AddImagensToProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :produtos, :imagem1, :string
    add_column :produtos, :imagem2, :string
  end
end
