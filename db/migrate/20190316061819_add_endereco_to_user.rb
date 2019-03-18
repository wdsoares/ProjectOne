class AddEnderecoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :endereco, :string
  end
end
