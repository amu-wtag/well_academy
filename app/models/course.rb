class Course < ApplicationRecord
  belongs_to :teacher, class_name: "User"  # Association to the User model
  belongs_to :category

  has_one_attached :completion_certificate
  has_one_attached :achievement_certificate

  enum :level, { beginner: 0, intermediate: 1, advanced: 2 }

  validates :title, presence: true
  validates :level, inclusion: { in: levels.keys }
end
