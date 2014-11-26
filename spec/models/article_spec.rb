require "rails_helper"

describe Article do
  it { should belong_to(:user) }
end
