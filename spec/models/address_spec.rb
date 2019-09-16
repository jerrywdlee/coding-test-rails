require "rails_helper"

RSpec.describe Address, type: :model do
  before do
    @address = create(:address)
  end

  it "Should has a phone and city" do
    expect(@address.phone).to be_truthy
    expect(@address.city).to be_truthy
  end

  it "Should has prefecture" do
    expect(@address.prefecture.name).to be_truthy
  end

  it "Should has customer" do
    expect(@address.customer.name).to be_truthy
  end
end
