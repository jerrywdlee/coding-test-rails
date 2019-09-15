class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :address
  has_one :customer, through: :address
end
