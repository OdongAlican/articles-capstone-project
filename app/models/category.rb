class Category < ApplicationRecord
  validates :name, presence: true
  validates :priority, presence: true
  validates_uniqueness_of :priority
  validates_uniqueness_of :name

  has_many :article_categories, foreign_key: :category_id, dependent: :destroy
  has_many :articles, through: :article_categories, source: :article
  belongs_to :user

  scope :most_important, -> { order('priority asc').limit(100) }

  def latest_article
    result = articles.order('created_at DESC')
    result
  end
end
