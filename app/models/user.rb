class User < ApplicationRecord
  has_secure_password  # For password hashing and authentication

  has_one_attached :profile_picture
  has_many_attached :certificates

  enum role: %i[student teacher admin].freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: roles.keys }

  def pic_resize(x, y)
    x = x.to_i
    y = y.to_i
    # puts "\n\n ***Converted x: #{x}, Converted y: #{y}" # Debugging line

    profile_picture.variant(resize_to_limit: [ x, y ])
  end
end
