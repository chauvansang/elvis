class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :acad_year
      t.string :class_number
      t.integer :day
      t.time :start
      t.time :end
      t.string :type
      t.string :module_code
      t.integer :semester
      t.string :venue
      t.string :week_code

      t.timestamps null: false
    end
  end
end
