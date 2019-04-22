class CreateForgotpwds < ActiveRecord::Migration[5.1]
  def change
    create_table :forgotpwds do |t|

      t.timestamps
    end
  end
end
