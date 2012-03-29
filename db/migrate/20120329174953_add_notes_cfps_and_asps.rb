class AddNotesCfpsAndAsps < ActiveRecord::Migration
  def change
    add_column :cash_flow_plans, :notes, :text
    add_column :allocated_spending_plans, :notes, :text
  end
end
