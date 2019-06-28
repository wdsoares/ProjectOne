class AddColumnsToDenuncia < ActiveRecord::Migration[5.1]
  def change
    add_column :denuncia, :idAnuncio, :integer
    add_column :denuncia, :reclamacao, :string
    add_column :denuncia, :validacao, :boolean
    add_column :denuncia, :estado, :string
  end
end
