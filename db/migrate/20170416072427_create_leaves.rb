class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.datetime :start
      t.integer :month
      t.datetime :end
      t.string :leave_type
      t.text :reason
      t.integer :num_of_days

      t.timestamps
    end
  end
end
