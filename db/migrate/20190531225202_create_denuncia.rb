class CreateDenuncia < ActiveRecord::Migration[5.1]
  def change
    create_table :denuncia do |t|

      t.timestamps
    end
  end
end
