class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items
  accepts_nested_attributes_for :budget_items

  validates :household_income, :presence => true
  validates_numericality_of :household_income, :allow_blank => true
  validates :date, :presence => true
  # validates_format_of :date, :with => /^(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(20|21)\d\d$/, :message => 'must be in mm/dd/yyyy format', :allow_blank => true

end
