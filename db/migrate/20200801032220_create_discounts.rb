class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.integer :percent_off
      t.integer :minimum_quantity

      t.timestamps
    end
  end
end
