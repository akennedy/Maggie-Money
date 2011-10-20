require 'spec_helper'

describe AllocatedSpendingPlan do

  subject { build :allocated_spending_plan }

  it { should be_valid }

  it { build(:allocated_spending_plan, :week_1_income => "abc").should_not be_valid }
  it { build(:allocated_spending_plan, :week_2_income => "abc").should_not be_valid }
  it { build(:allocated_spending_plan, :week_3_income => "abc").should_not be_valid }
  it { build(:allocated_spending_plan, :week_4_income => "abc").should_not be_valid }
end