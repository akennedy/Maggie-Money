class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  accepts_nested_attributes_for :transactions
end
