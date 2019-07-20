class Company < ApplicationRecord
  belongs_to :insurance
  has_one :address, as: :addressable
end
