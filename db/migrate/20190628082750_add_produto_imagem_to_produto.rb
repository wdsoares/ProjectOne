class AddProdutoImagemToProduto < ActiveRecord::Migration[5.1]
  def change
    add_column :produtos, :produtoimagem, :string
  end
end
