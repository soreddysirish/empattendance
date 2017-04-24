class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.float :basic
      t.float :hra
      t.float :ta
      t.float :ma
      t.float :residuapay
      t.float :pf
      t.float :profTax
      t.float :totEarnings
      t.float :totDeductions
      t.integer :lop
      t.integer :daysInMonth
      t.integer :effectiveWorkDays
      t.float :netPay
      t.integer :month
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
