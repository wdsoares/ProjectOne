class AddColumnProdutoUser < ActiveRecord::Migration[5.1]
  def self.up
    add_column :produtos, :user_id, :integer
  end

 def self.down
    remove_column :produtos, :user_id
 end
end
