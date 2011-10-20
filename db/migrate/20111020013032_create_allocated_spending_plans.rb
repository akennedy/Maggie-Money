class CreateAllocatedSpendingPlans < ActiveRecord::Migration
  def change
    create_table :allocated_spending_plans do |t|
      t.integer :user_id
      t.date :date
      t.date :week_1_date
      t.date :week_2_date
      t.date :week_3_date
      t.date :week_4_date
      t.decimal :household_income, :precision => 10, :scale => 2
      t.decimal :week_1_income, :precision => 10, :scale => 2
      t.decimal :week_2_income, :precision => 10, :scale => 2
      t.decimal :week_3_income, :precision => 10, :scale => 2
      t.decimal :week_4_income, :precision => 10, :scale => 2
      t.timestamps
    end

    create_table :allocated_spending_plan_items do |t|
      t.integer :allocated_spending_plan_id
      t.string :name
      t.string :category
      t.decimal :week_1_amount, :precision => 10, :scale => 2
      t.decimal :week_2_amount, :precision => 10, :scale => 2
      t.decimal :week_3_amount, :precision => 10, :scale => 2
      t.decimal :week_4_amount, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
