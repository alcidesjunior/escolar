class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.references :student, index: true
      t.references :discipline, index: true
      t.references :grade, index: true
      t.string :status,default: 'p'
      t.timestamps null: false
    end
  end
end
