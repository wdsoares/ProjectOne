class AddFotosToFotosProdutos < ActiveRecord::Migration[5.1]
  def change
    add_column :fotos_produtos, :foto1, :string
    add_column :fotos_produtos, :foto2, :string
    add_column :fotos_produtos, :foto3, :string
  end
end
