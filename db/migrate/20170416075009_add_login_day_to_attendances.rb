class AddLoginDayToAttendances < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :login_day, :integer
  end
end
