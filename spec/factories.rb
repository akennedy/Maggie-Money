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

end