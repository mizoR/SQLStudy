class CreateStudentClubs < ActiveRecord::Migration
  def change
    create_table :student_clubs, id: false do |t|
      t.integer :std_id, null: false
      t.integer :club_id, null: false
      t.string :club_name, null: false
      t.boolean :main_club_flg, null: false
    end
  end
end
