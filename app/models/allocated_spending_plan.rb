class AllocatedSpendingPlan < ActiveRecord::Base
  belongs_to :user
  has_many :allocated_spending_plan_items, :dependent => :destroy
  accepts_nested_attributes_for :allocated_spending_plan_items

  validates_numericality_of :week_1_income, :allow_blank => true
  validates_numericality_of :week_2_income, :allow_blank => true
  validates_numericality_of :week_3_income, :allow_blank => true
  validates_numericality_of :week_4_income, :allow_blank => true

end