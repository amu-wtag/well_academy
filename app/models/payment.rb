class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum payment_type: %i[bkash nagad rocket brac_bank ibbl city_bank].freeze
  enum status: %i[unpaid paid].freeze

  validates :course_price, presence: true
end
