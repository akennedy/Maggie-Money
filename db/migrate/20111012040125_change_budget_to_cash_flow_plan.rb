class ChangeBudgetToCashFlowPlan < ActiveRecord::Migration
  def up
    rename_column :budget_items, :budget_id, :cash_flow_plan_id
    rename_table :budgets, :cash_flow_plans
    rename_table :budget_items, :cash_flow_plan_items
  end

  def down
    rename_table :cash_flow_plan_items, :budget_items
    rename_table :cash_flow_plans, :budgets
    rename_column :budget_items, :cash_flow_plan_id, :budget_id
  end
end
