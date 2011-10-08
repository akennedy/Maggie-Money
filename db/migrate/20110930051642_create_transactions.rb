class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :budget_id
      t.string :name
      t.string :category
      t.decimal :amount, :precision => 10, :scale => 2
      t.decimal :actual, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
