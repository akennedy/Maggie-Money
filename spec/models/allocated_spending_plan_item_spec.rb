require 'spec_helper'

describe AllocatedSpendingPlanItem do

  subject { build :allocated_spending_plan_item }

  it { should be_valid }

  it { build(:allocated_spending_plan_item, :week_1_amount => "abc").should_not be_valid }
  it { build(:allocated_spending_plan_item, :week_2_amount => "abc").should_not be_valid }
  it { build(:allocated_spending_plan_item, :week_3_amount => "abc").should_not be_valid }
  it { build(:allocated_spending_plan_item, :week_4_amount => "abc").should_not be_valid }

end