class Insured < ApplicationRecord
  belongs_to :insurance
  has_one :address, as: :addressable
end
