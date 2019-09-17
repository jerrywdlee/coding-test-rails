require "rails_helper"

RSpec.describe "DataImport" do
  it "Should load titanic csv" do
    csv_path = Rails.root.join("spec/support/csv/titanic.csv")
    DataImport.load_titanic_csv(csv_path)

    expect(Passenger.all.size).to be > 0
    expect(Passenger.male.size).to be > 0
    expect(Passenger.female.size).to be > 0
    expect(Passenger.first_class.size).to be > 0
  end

  it "Should load sales data csv" do
    DataImport.load_sales_data_csv

    expect(Address.all.size).to be > 0
    expect(Customer.all.size).to be > 0
    expect(Item.all.size).to be > 0
    expect(Purchase.all.size).to be > 0
    expect(Review.all.size).to be > 0
    expect(Tag.all.size).to be > 0

    @q = Customer.ransack({
      reviewed_items_price_gt: 100,
      reviewed_items_price_lt: 150,
    })
    expect(@q.result.distinct.size).to be > 0
  end
end