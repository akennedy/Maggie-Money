class AllocatedSpendingPlanItem < ActiveRecord::Base
  belongs_to :allocated_spending_plan
  belongs_to :user

  validates :week_1_amount, :numericality => true, :allow_blank => true
  validates :week_2_amount, :numericality => true, :allow_blank => true
  validates :week_3_amount, :numericality => true, :allow_blank => true
  validates :week_4_amount, :numericality => true, :allow_blank => true

  CATEGORIES = [
    {:name => 'charity', :items => ['gifts']},
    {:name => 'saving', :items => ['emergency_fund', 'retirement_fund', 'college_fund']},
    {:name => 'housing', :items => ['first_mortgage', 'second_mortgage', 'real_estate_taxes', 'homeowners_insurance', 'repairs_or_maintenance', 'replace_furniture']},
    {:name => 'utilities', :items => ['electricity', 'water', 'gas', 'phone', 'trash', 'cable']},
    {:name => 'food', :items => ['grocery', 'restaurant']},
    {:name => 'transportation', :items => ['car_payment_1', 'car_payment_2', 'gas_and_oil', 'repairs_and_tires', 'car_insurance', 'license_and_tags', 'car_replacement']},
    {:name => 'clothing', :items => ['children', 'adults', 'laundry']},
    {:name => 'medical', :items => ['disability_insurance', 'health_insurance', 'doctor_bills', 'dentist', 'optometrist', 'medications']},
    {:name => 'personal', :items => ['life_insurance', 'child_care', 'baby_sitter', 'toiletries', 'cosmetics', 'hair_care', 'education_adult', 'school_tuition', 'school_supplies', 'child_support', 'alimony', 'subscriptions', 'organization_dues', 'gifts', 'miscellaneous', 'blow_money']},
    {:name => 'recreation', :items => ['entertainment', 'vacation']},
    {:name => 'debts', :items => ['visa_1', 'visa_2', 'master_card_1', 'master_card_2', 'american_express', 'discover_card', 'gas_card_1', 'gas_card_2', 'department_store_1', 'department_store_2', 'finance_company_1', 'finance_company_2', 'credit_line', 'student_loan_1', 'student_loan_2']}
  ]

  def category?(category_name)
    read_attribute(:category) == category_name
  end
end