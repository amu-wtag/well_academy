class User < ApplicationRecord
  has_secure_password

  has_one_attached :profile_picture
  has_many_attached :student_certificates
  has_many_attached :teacher_certificates

  enum role: %i[student teacher admin].freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: roles.keys }
end
