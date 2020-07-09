class Article < ApplicationRecord
  validates :title, presence: true
  validates :text,  presence: true, length: { maximum: 2000,
                                             too_long: '2000 characters in comment is the maximum allowed.' }

  has_one_attached :image
  validates :image, presence: true
  belongs_to :author, class_name: 'User'
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories, dependent: :destroy
  has_many :votes, dependent: :destroy
end
