# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130421191732) do

  create_table "allocated_spending_plan_items", :force => true do |t|
    t.integer  "allocated_spending_plan_id"
    t.string   "name"
    t.string   "category"
    t.decimal  "week_1_amount",              :precision => 10, :scale => 2
    t.decimal  "week_2_amount",              :precision => 10, :scale => 2
    t.decimal  "week_3_amount",              :precision => 10, :scale => 2
    t.decimal  "week_4_amount",              :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allocated_spending_plans", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.date     "week_1_date"
    t.date     "week_2_date"
    t.date     "week_3_date"
    t.date     "week_4_date"
    t.decimal  "household_income",  :precision => 10, :scale => 2
    t.decimal  "week_1_income",     :precision => 10, :scale => 2
    t.decimal  "week_2_income",     :precision => 10, :scale => 2
    t.decimal  "week_3_income",     :precision => 10, :scale => 2
    t.decimal  "week_4_income",     :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cash_flow_plan_id"
    t.text     "notes"
  end

  create_table "breakdown_of_saving_items", :force => true do |t|
    t.integer  "breakdown_of_saving_id"
    t.string   "name"
    t.decimal  "amount",                 :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breakdown_of_savings", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.decimal  "balance",    :precision => 10, :scale => 2
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_flow_plan_items", :force => true do |t|
    t.integer  "cash_flow_plan_id"
    t.string   "name"
    t.string   "category"
    t.decimal  "amount",            :precision => 10, :scale => 2
    t.decimal  "actual",            :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_flow_plans", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.decimal  "household_income",    :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.string   "confirmation_number"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
