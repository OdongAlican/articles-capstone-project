class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :name, presence: true, length: { minimum: 3, maximum: 25 },uniqueness: true
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    has_many :created_articles, foreign_key: 'author_id', class_name: 'Article'
    has_many :votes, dependent: :destroy

end
