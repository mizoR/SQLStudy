class CreateProducts2 < ActiveRecord::Migration
  def change
    create_table :products2, id: false do |t|
      t.string :name, null: false
      t.integer :price, null: false
    end
  end
end
