require "rails_helper"

RSpec.describe Tag, type: :model do
  before do
    @tag = create(:tag, :with_items)
  end

  it "Should has a name" do
    expect(@tag.name).to be_truthy
  end

  it "Should has items" do
    expect(@tag.items.size).to be > 1
  end
end
