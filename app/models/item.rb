class Item < ApplicationRecord
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :customer
  has_many :purchases
  has_many :addresses, through: :purchases
  has_many :customers, through: :addresses
  has_and_belongs_to_many :tags, -> { distinct }
end
