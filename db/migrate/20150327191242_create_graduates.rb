class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates, id: false do |t|
      t.string :name
      t.integer :income
    end
  end
end
