class AddDescToDenuncia < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :desc, :string
  end
end
