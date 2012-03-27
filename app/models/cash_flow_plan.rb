class CashFlowPlan < ActiveRecord::Base
  belongs_to :user
  has_many :cash_flow_plan_items, :dependent => :destroy
  accepts_nested_attributes_for :cash_flow_plan_items

  validates :household_income, :presence => true
  validates_numericality_of :household_income, :allow_blank => true
  validates :date, :presence => true

  def budgeted
    cash_flow_plan_items.sum(:amount)
  end

  def remaining
    household_income - budgeted
  end

end
