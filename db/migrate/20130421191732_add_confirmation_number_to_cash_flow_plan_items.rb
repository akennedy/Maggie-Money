class AddConfirmationNumberToCashFlowPlanItems < ActiveRecord::Migration
  def change
    add_column :cash_flow_plan_items, :confirmation_number, :string
  end
end
