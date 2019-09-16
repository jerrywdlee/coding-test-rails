require "rails_helper"

RSpec.describe Item, type: :model do
  before do
    @item = create(:item)
  end

  it "Should has a name and price" do
    expect(@item.name).to be_truthy
    expect(@item.price).to be_truthy
  end
end
