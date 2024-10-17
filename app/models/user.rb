class User < ApplicationRecord
  has_secure_password  # For password hashing and authentication

  has_one_attached :profile_picture
  has_many_attached :certificates

  enum :role, { student: 0, teacher: 1, admin: 2 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: roles.keys }
end
