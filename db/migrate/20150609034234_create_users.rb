class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :index
      t.string :gender
      t.string :faculty
      t.string :first_major
      t.string :second_major
      t.integer :matric_year

      t.timestamps null: false
    end
  end
end
