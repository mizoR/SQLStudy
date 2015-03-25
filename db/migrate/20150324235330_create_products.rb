class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.string :name, null: false
      t.integer :price, null: false
    end
  end
end
