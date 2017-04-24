# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170418111101) do

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "month"
    t.datetime "start"
    t.datetime "end"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "login_day"
    t.index ["employee_id"], name: "index_attendances_on_employee_id", using: :btree
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "firstName"
    t.string   "lastName"
    t.string   "empId"
    t.text     "address",                limit: 65535
    t.string   "gender"
    t.string   "mobileNumber"
    t.string   "designation"
    t.date     "dob"
    t.date     "doj"
    t.string   "pfNumber"
    t.string   "panNumber"
    t.string   "accountNumber"
    t.string   "bankName"
    t.string   "branch"
    t.string   "ifscCode"
    t.string   "accountType"
    t.integer  "available_leaves"
    t.string   "role"
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start"
    t.integer  "month"
    t.datetime "end"
    t.string   "leave_type"
    t.text     "reason",      limit: 65535
    t.integer  "num_of_days"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "employee_id"
    t.string   "color"
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "basic",             limit: 24
    t.float    "hra",               limit: 24
    t.float    "ta",                limit: 24
    t.float    "ma",                limit: 24
    t.float    "residuapay",        limit: 24
    t.float    "pf",                limit: 24
    t.float    "profTax",           limit: 24
    t.float    "totEarnings",       limit: 24
    t.float    "totDeductions",     limit: 24
    t.integer  "lop"
    t.integer  "daysInMonth"
    t.integer  "effectiveWorkDays"
    t.float    "netPay",            limit: 24
    t.integer  "month"
    t.integer  "employee_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["employee_id"], name: "index_reports_on_employee_id", using: :btree
  end

  create_table "salaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "empName"
    t.string   "empId"
    t.integer  "basicSal"
    t.integer  "hra"
    t.integer  "da"
    t.integer  "ta"
    t.integer  "medicalAllowances"
    t.integer  "residualPay"
    t.integer  "pf"
    t.integer  "ProfTax"
    t.integer  "employee_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id", using: :btree
  end

  add_foreign_key "attendances", "employees"
  add_foreign_key "reports", "employees"
  add_foreign_key "salaries", "employees"
end
