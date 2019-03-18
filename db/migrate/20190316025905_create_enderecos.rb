class CreateEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :cep
      t.string :bairro
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
