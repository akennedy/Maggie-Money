class BreakdownOfSaving < ActiveRecord::Base
  belongs_to :user
  has_many :breakdown_of_saving_items, :dependent => :destroy
  accepts_nested_attributes_for :breakdown_of_saving_items

  validates :balance, :presence => true
  validates_numericality_of :balance, :allow_blank => true
  validates :date, :presence => true

  def budgeted
    breakdown_of_saving_items.sum(:amount)
  end

  def remaining
    balance - budgeted
  end

end