require 'spec_helper'

describe Envelope do
  describe "#balance" do
    it "should calculate the correct balance" do
      envelope                = Envelope.create(:name => "Savings")
      transaction             = envelope.transactions.create(:description => "Adam's Paycheck", :amount => BigDecimal("5000.00"))
      envelope.balance.should == BigDecimal("5000.00")
      transaction_2           = envelope.transactions.create(:description => "Need money for computer", :amount => BigDecimal("-1246.33")) 
      envelope.balance.should == BigDecimal("3753.67")
    end
  end
end
