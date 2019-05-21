class RemoveEnderecoFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :endereco, :string
  end
end
