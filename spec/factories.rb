FactoryGirl.define do

  factory :user do
    email                 "andrew@jackrussellsoftware.com"
    password              "14921492"
    password_confirmation "14921492"
  end

  factory :cash_flow_plan do
    household_income      "1000.00"
    date                  Date.today
  end

  factory :cash_flow_plan_item do
    name                  "gifts"
    category              "charity"
    amount                "100.00"
    actual                "50.00"
  end

  factory :allocated_spending_plan do
    week_1_income         "1000.00"
    week_2_income         "1000.00"
    week_3_income         "1000.00"
    week_4_income         "1000.00"
    week_1_date           Date.today
    week_2_date           Date.today + 1.week
    week_3_date           Date.today + 2.weeks
    week_4_date           Date.today + 3.weeks
  end

  factory :allocated_spending_plan_item do
    name                  "gifts"
    category              "charity"
    week_1_amount         "100.00"
    week_2_amount         "100.00"
    week_3_amount         "100.00"
    week_4_amount         "100.00"
  end

end