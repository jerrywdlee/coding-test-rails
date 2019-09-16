require "rails_helper"

RSpec.describe Customer, type: :model do
  before do
    @customer = create(:customer)
  end

  it "Should has a name and email" do
    expect(@customer.name).to be_truthy
    expect(@customer.email).to be_truthy
  end
end
