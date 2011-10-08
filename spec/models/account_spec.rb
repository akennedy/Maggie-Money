require 'spec_helper'

describe Account do
  describe "#balance" do
    it "should calculate the correct balance" do
      account       = Account.create(:name => "Wells Fargo")
      envelope      = account.envelopes.create(:name => "Savings")
      transaction   = envelope.transactions.create(:description => "Deposit from Check", :amount => BigDecimal("50.00"))
      account.balance.should == BigDecimal("50.00")
      transaction_2 = envelope.transactions.create(:description => "Taking out money from savings", :amount => BigDecimal("-42.12"))
      account.balance.should == BigDecimal("7.88")
    end
  end
end
