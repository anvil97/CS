class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.string :name
      t.decimal :percent
      t.date :from_date
      t.date :to_date
      t.integer :proviso

      t.timestamps
    end
  end
end
