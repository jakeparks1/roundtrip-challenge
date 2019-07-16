class Insurance < ApplicationRecord
  has_one :plan
  has_one :company
  has_many :insureds
end
