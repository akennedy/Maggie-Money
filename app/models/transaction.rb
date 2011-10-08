class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :user

  CATEGORIES = ['charity', 'saving', 'housing', 'utilities', 'food', 'transportation', 'clothing', 'medical', 'personal', 'recreation', 'debts']
  ITEMS = [
    {:name => 'gifts', :category => 'charity'},
    {:name => 'emergency_fund', :category => 'saving'},
    {:name => 'retirement_fund', :category => 'saving'},
    {:name => 'college_fund', :category => 'saving'},
    {:name => 'first_mortgage', :category => 'housing'},
    {:name => 'second_mortgage', :category => 'housing'},
    {:name => 'real_estate_taxes', :category => 'housing'},
    {:name => 'homeowners_insurance', :category => 'housing'},
    {:name => 'repairs_or_maintenance', :category => 'housing'},
    {:name => 'replace_furniture', :category => 'housing'},
    {:name => 'electricity', :category => 'utilities'},
    {:name => 'water', :category => 'utilities'},
    {:name => 'gas', :category => 'utilities'},
    {:name => 'phone', :category => 'utilities'},
    {:name => 'trash', :category => 'utilities'},
    {:name => 'cable', :category => 'utilities'},
    {:name => 'grocery', :category => 'food'},
    {:name => 'restaurant', :category => 'food'},
    {:name => 'car_payment_1', :category => 'transportation'},
    {:name => 'car_payment_2', :category => 'transportation'},
    {:name => 'gas_and_oil', :category => 'transportation'},
    {:name => 'repairs_and_tires', :category => 'transportation'},
    {:name => 'car_insurance', :category => 'transportation'},
    {:name => 'license_and_tags', :category => 'transportation'},
    {:name => 'car_replacement', :category => 'transportation'},
    {:name => 'children', :category => 'clothing'},
    {:name => 'adults', :category => 'clothing'},
    {:name => 'laundry', :category => 'clothing'},
    {:name => 'disability_insurance', :category => 'medical'},
    {:name => 'health_insurance', :category => 'medical'},
    {:name => 'doctor_bills', :category => 'medical'},
    {:name => 'dentist', :category => 'medical'},
    {:name => 'optometrist', :category => 'medical'},
    {:name => 'medications', :category => 'medical'},
    {:name => 'life_insurance', :category => 'personal'},
    {:name => 'child_care', :category => 'personal'},
    {:name => 'baby_sitter', :category => 'personal'},
    {:name => 'toiletries', :category => 'personal'},
    {:name => 'cosmetics', :category => 'personal'},
    {:name => 'hair_care', :category => 'personal'},
    {:name => 'education_adult', :category => 'personal'},
    {:name => 'school_tuition', :category => 'personal'},
    {:name => 'school_supplies', :category => 'personal'},
    {:name => 'child_support', :category => 'personal'},
    {:name => 'alimony', :category => 'personal'},
    {:name => 'subscriptions', :category => 'personal'},
    {:name => 'organization_dues', :category => 'personal'},
    {:name => 'gifts', :category => 'personal'},
    {:name => 'miscellaneous', :category => 'personal'},
    {:name => 'blow_money', :category => 'personal'},
    {:name => 'entertainment', :category => 'recreation'},
    {:name => 'vacation', :category => 'recreation'},
    {:name => 'visa_1', :category => 'debts'},
    {:name => 'visa_2', :category => 'debts'},
    {:name => 'master_card_1', :category => 'debts'},
    {:name => 'master_card_2', :category => 'debts'},
    {:name => 'american_express', :category => 'debts'},
    {:name => 'discover_card', :category => 'debts'},
    {:name => 'gas_card_1', :category => 'debts'},
    {:name => 'gas_card_2', :category => 'debts'},
    {:name => 'department_store_1', :category => 'debts'},
    {:name => 'department_store_2', :category => 'debts'},
    {:name => 'finance_company_1', :category => 'debts'},
    {:name => 'finance_company_2', :category => 'debts'},
    {:name => 'credit_line', :category => 'debts'},
    {:name => 'student_loan_1', :category => 'debts'},
    {:name => 'student_loan_2', :category => 'debts'},
  ]

  def category?(category_name)
    read_attribute(:category) == category_name
  end
end
