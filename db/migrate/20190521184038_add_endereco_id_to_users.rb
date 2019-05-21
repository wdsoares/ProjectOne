class AddEnderecoIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :enderecoID, :integer
  end
end
