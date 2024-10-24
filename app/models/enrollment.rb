class Enrollment < ApplicationRecord
  belongs_to :student, class_name: "User"
  belongs_to :course

  enum completion_status: %i[not_started in_progress completed].freeze

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :enrolled_at, presence: true
  validates :progress, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0 }
  validates :completion_status, inclusion: { in: completion_statuses.keys }
end
