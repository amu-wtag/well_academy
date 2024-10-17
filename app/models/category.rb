class Category < ApplicationRecord
  has_many :courses
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, presence: true
end
