class Customer < ApplicationRecord
  has_many :addresses
  has_many :reviews
end
