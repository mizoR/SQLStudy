class CreatePopTbls < ActiveRecord::Migration
  def change
    create_table :pop_tbls, id: false do |t|
      t.string :pref_name, null: false
      t.integer :population, null: false
    end
  end
end
