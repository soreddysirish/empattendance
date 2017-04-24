class AddDetailsToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :firstName, :string
    add_column :employees, :lastName, :string
    add_column :employees, :epmId, :string
    add_column :employees, :address, :text
    add_column :employees, :gender, :string
    add_column :employees, :mobileNumber, :string
    add_column :employees, :designation, :string
    add_column :employees, :dob, :date
    add_column :employees, :doj, :date
    add_column :employees, :pfNumber, :string
    add_column :employees, :panNumber, :string
    add_column :employees, :accountNumber, :string
    add_column :employees, :bankName, :string
    add_column :employees, :branch, :string
    add_column :employees, :ifscCode, :string
    add_column :employees, :accountType, :string
  end
end
