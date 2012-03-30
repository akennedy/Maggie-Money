class CreateBreakdownOfSavings < ActiveRecord::Migration
  def change
    create_table :breakdown_of_savings do |t|
      t.integer :user_id
      t.date :date
      t.decimal :balance, :precision => 10, :scale => 2
      t.text :notes
      t.timestamps
    end

    create_table :breakdown_of_saving_items do |t|
      t.integer :breakdown_of_saving_id
      t.string :name
      t.decimal :amount, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
