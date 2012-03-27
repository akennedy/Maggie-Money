class AllocatedSpendingPlan < ActiveRecord::Base
  belongs_to :user
  belongs_to :cash_flow_plan
  has_many :cash_flow_plan_items, :through => :cash_flow_plan
  has_many :allocated_spending_plan_items, :dependent => :destroy
  accepts_nested_attributes_for :allocated_spending_plan_items

  validates_numericality_of :week_1_income, :allow_blank => true
  validates_numericality_of :week_2_income, :allow_blank => true
  validates_numericality_of :week_3_income, :allow_blank => true
  validates_numericality_of :week_4_income, :allow_blank => true

  validates :household_income, :presence => true
  validates_numericality_of :household_income, :allow_blank => true
  validates :date, :presence => true

  def budgeted
    allocated_spending_plan_items.collect{|item| item.amount}.sum
  end

  def remaining
    household_income - budgeted
  end

end