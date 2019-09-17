require "rails_helper"

RSpec.describe Review, type: :model do
  before do
    @review = create(:review)
  end

  it "Should has a score and text" do
    expect(@review.score).to be_truthy
    expect(@review.text).to be_truthy
  end

  it "Should has item and customer" do
    expect(@review.item).to be_truthy
    expect(@review.customer).to be_truthy
  end
end
