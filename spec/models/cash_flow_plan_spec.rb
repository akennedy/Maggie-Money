require 'spec_helper'

describe CashFlowPlan do

  subject { build :cash_flow_plan }

  it { should be_valid }

  it { build(:cash_flow_plan, :household_income => "abc").should_not be_valid }
end