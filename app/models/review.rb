class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :cosme, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 200 }
  
  has_many :favoriteds, class_name: 'Favorite', foreign_key: 'review_id'
  has_many :favoritedbys, through: :favorites, source: :user
end