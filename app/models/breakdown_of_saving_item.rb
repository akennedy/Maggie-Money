class BreakdownOfSavingItem < ActiveRecord::Base
  belongs_to :breakdown_of_saving
  belongs_to :user

  validates :amount, :numericality => true, :allow_blank => true

  ITEMS = ['emergency_fund_(1)_$1000', 'emergency_fund_(2)_3-6_months', 'retirement_fund', 'college_fund',
           'real_estate_taxes', 'homeowners_insurance', 'repairs_or_mn._fee', 'replace_furniture',
           'car_insurance', 'car_replacement', 'disability_insurance', 'health_insurance', 'doctor',
           'dentist', 'optometrist', 'life_insurance', 'school_tuition', 'school_supplies',
           'Gifts (incl. Christmas)', 'vacation'
          ]

end