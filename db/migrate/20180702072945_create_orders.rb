class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total
      t.decimal :tax
      t.integer :subtotal
      t.references :order_status, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
