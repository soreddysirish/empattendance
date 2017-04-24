class DropAttendances < ActiveRecord::Migration[5.0]
  def change
  	drop_table :attendances
  end
end
