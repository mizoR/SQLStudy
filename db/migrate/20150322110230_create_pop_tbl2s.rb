class CreatePopTbl2s < ActiveRecord::Migration
  def change
    create_table :pop_tbl2s, id: false do |t|
      t.string :pref_name, null: false
      t.integer :sex, null: false
      t.integer :population, null: false
    end
  end
end
