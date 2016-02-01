class CreateGradeestudents < ActiveRecord::Migration
  def change
    create_table :gradeestudents do |t|
      t.integer :student_id
  	  t.integer :grade_id
      t.timestamps null: false
    end
  end
end
