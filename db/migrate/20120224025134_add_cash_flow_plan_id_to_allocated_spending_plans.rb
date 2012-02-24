class AddCashFlowPlanIdToAllocatedSpendingPlans < ActiveRecord::Migration
  def change
    add_column :allocated_spending_plans, :cash_flow_plan_id, :integer
  end
end
