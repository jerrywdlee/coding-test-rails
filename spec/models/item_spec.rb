require "rails_helper"

RSpec.describe Item, type: :model do
  before do
    @item = create(:item, :with_tags)
  end

  it "Should has a name and price" do
    expect(@item.name).to be_truthy
    expect(@item.price).to be_truthy
  end

  it "Should has tags" do
    expect(@item.tags.size).to be > 1
  end
end
