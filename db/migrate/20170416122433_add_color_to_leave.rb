class AddColorToLeave < ActiveRecord::Migration[5.0]
  def change
    add_column :leaves, :color, :string
  end
end
