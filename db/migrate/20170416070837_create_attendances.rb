class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.integer :month
      t.datetime :start
      t.datetime :end
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
