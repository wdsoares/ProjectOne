class CreateCompras < ActiveRecord::Migration[5.1]
  def change
    create_table :compras do |t|

      t.timestamps
    end
  end
end
