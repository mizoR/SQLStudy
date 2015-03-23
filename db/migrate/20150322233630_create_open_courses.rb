class CreateOpenCourses < ActiveRecord::Migration
  def change
    create_table :open_courses, id: false do |t|
      t.integer :month, null: false
      t.integer :course_id, null: false
    end
  end
end
