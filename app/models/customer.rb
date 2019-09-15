class Customer < ApplicationRecord
  has_many :addresses
  has_many :purchases, through: :addresses
  has_many :purchased_items, through: :purchases, source: :item
  has_many :reviews
  has_many :reviewed_items, through: :reviews, source: :item
end
