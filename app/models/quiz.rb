class Quiz < ApplicationRecord
  belongs_to :course

  validates :title, presence: true
  validates :total_marks, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
