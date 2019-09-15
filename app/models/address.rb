class Address < ApplicationRecord
  belongs_to :customer
  has_many :purchases
end
