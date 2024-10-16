class Lesson < ApplicationRecord
  belongs_to :course

  has_one_attached :video
  has_many_attached :contents

  validates :title, presence: true
  validates :order, presence: true
end
