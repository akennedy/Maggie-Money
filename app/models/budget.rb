class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items
  accepts_nested_attributes_for :budget_items

  validates :household_income, :presence => true
  validates_numericality_of :household_income, :allow_blank => true
  validates :date, :presence => true

end
