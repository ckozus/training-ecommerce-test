class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :status

      t.timestamps null: false
    end
  end
end
