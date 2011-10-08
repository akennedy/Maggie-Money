require 'spec_helper'

describe Paycheck do
  describe "#payout" do
    it "should pay money to the correct envelopes" do
      paycheck = Paycheck.create(:name => "Adam's Paycheck", :amount => BigDecimal("500.00"))
      envelope = Envelope.create(:name => "Savings")
      envelope_1 = Envelope.create(:name => "Blow Money")
      paycheck.setup_envelope_deposit(envelope,BigDecimal("300"))
      paycheck.setup_envelope_deposit(envelope_1,BigDecimal("200"))
      paycheck.payout!
      envelope.balance.should == BigDecimal("300")
      envelope_1.balance.should == BigDecimal("200")
    end

    it "should not let you create payments greater than the amount" do
      paycheck = Paycheck.create(:name => "Adam's Paycheck", :amount => BigDecimal("299.99"))
      envelope = Envelope.create(:name => "Savings")
      paycheck.setup_envelope_deposit(envelope,BigDecimal("300")).should == false
    end
  end
end
