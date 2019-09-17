require "rails_helper"

RSpec.describe Purchase, type: :model do
  before do
    @purchase = create(:purchase)
  end

  it "Should has purchase number" do
    expect(@purchase.number).to be_truthy
  end

  it "Should has item, address and customer" do
    expect(@purchase.item).to be_truthy
    expect(@purchase.address).to be_truthy
    expect(@purchase.customer).to be_truthy
  end
end
