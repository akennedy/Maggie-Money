require 'spec_helper'

describe CashFlowPlanItem do

  subject { build :cash_flow_plan_item }

  it { should be_valid }

  it { build(:cash_flow_plan_item, :amount => "abc").should_not be_valid }
  it { build(:cash_flow_plan_item, :actual => "abc").should_not be_valid }

  it 'should determine if in category' do
    subject.category?('charity').should be_true
    subject.category?('stealing').should be_false
  end
end