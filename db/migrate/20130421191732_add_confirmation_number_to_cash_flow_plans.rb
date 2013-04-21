class AddConfirmationNumberToCashFlowPlans < ActiveRecord::Migration
  def change
    add_column :cash_flow_plans, :confirmation_number, :string
  end
end
