class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :nis
      t.string :mother_name
      t.string :father_name
      t.string :dn
      t.string :address
      t.string :phone
      t.integer :registration # número de matrícula

      t.references :grade, index: true
      t.references :discipline, index: true
      
      t.timestamps null: false
    end
  end
end
