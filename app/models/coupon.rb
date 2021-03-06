class Coupon < ApplicationRecord
  belongs_to :promotion

  enum status: { active: 0, disabled: 10 }

  delegate :discount_rate, to: :promotion
end
