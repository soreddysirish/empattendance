class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.string :empName
      t.string :empId
      t.integer :basicSal
      t.integer :hra
      t.integer :da
      t.integer :ta
      t.integer :medicalAllowances
      t.integer :residualPay
      t.integer :pf
      t.integer :ProfTax
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
