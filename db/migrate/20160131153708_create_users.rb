class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.integer :level, default: 1
      t.timestamps null: false
    end
  end
end
