class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string  :titulo, :limit => 40
      t.string  :autores, :limit => 60
      t.integer  :edicao
      t.string  :data_pub, :limit => 10
      t.string :isbn, :limit => 13
      t.string :editora, :limit => 25
      t.timestamps
   end
  end
end
