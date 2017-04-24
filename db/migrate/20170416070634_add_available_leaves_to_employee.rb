class AddAvailableLeavesToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :available_leaves, :integer
  end
end
