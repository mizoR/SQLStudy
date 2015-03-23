class CreateCourseMasters < ActiveRecord::Migration
  def change
    create_table :course_masters, id: false do |t|
      t.integer :course_id, null: false
      t.string :course_name, null: false
    end
  end
end
