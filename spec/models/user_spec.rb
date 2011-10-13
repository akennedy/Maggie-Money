require 'spec_helper'

describe User do
  subject { build :user }

  it { should be_valid }
end