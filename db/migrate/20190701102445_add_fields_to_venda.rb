class AddFieldsToVenda < ActiveRecord::Migration[5.1]
  def change
    add_column :vendas, :idcomprador, :integer
    add_column :vendas, :idvendedor, :integer
    add_column :vendas, :idproduto, :integer
    add_column :vendas, :estado, :integer
  end
end
