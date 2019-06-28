class AddIduserToFotosProdutos < ActiveRecord::Migration[5.1]
  def change
    add_column :fotos_produtos, :iduser, :integer
  end
end
