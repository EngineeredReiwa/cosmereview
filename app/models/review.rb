class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :cosme, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
end