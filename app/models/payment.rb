class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum payment_type: { bkash: 0, bank: 1 } # Add more payment types as needed
  enum status: { unpaid: 0, paid: 1 }
end
