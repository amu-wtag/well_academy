class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum payment_type: { bkash: 0, nagad: 1, rocket: 2, brac_bank: 3, ibbl: 4, city_bank: 5 }
  enum status: { unpaid: 0, paid: 1 }

  validates :course_price, presence: true
end
