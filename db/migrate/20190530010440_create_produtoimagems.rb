class CreateProdutoimagems < ActiveRecord::Migration[5.1]
  def change
    create_table :produtoimagems do |t|
      t.integer :idproduto
      t.string :imagem

      t.timestamps
    end
  end
end
