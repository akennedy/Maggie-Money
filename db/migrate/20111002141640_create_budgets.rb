class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :user_id
      t.datetime :date
      t.decimal :household_income, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
