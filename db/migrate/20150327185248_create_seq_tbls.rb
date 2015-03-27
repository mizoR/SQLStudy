class CreateSeqTbls < ActiveRecord::Migration
  def change
    create_table :seq_tbls, id: false do |t|
      t.integer :seq, null: false
      t.string :name, null: false
    end
  end
end
