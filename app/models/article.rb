class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :author, class_name: 'User'
end
