class Payment < ApplicationRecord
  belongs_to :member

  validates :income_category, presence: true

  enum payment_category: { tithes: 0, harvest: 1, special_offering: 2, pledge: 3 }

end
